class Auction < ActiveRecord::Base
  EXPIRATION_AFTER = 7.days

  belongs_to :user
  belongs_to :winner, class_name: 'User'
  validates :title, presence: true
  validates :minimum_price, presence: true

  scope :created, where(state: :new)
  scope :public, where(state: :public)
  scope :closed, where(state: :closed)
  scope :won, where(state: :won)
  scope :finished, where('state = "closed" OR state = "won"')
  scope :won_by, ->(user) { where(state: :won).where(winner_id: user.id) }

  def self.about_to_finish
    time = Time.now
    now = Time.new(time.year, time.month, time.day, time.hour, 0)
    where(state: :public).
    where('created_at < ?', now - EXPIRATION_AFTER + 1.hour).
    where('created_at >= ?', now - EXPIRATION_AFTER)
  end

  # method used in search engine
  def self.search(query)
    if query
      where('(title LIKE ?) OR (description LIKE ?)', "%#{query}%", "%#{query}%")
    else
      scoped
    end
  end

  # method that closes every expired auction
  def self.close_auctions
    self.about_to_finish.each do |auction|
      auction.close if auction.winner.nil?
      auction.win if auction.winner.present?
    end
  end

  state_machine initial: :new do
    after_transition any => :public do |auction, transition|
      auction.actual_price = auction.minimum_price
      auction.save!
    end

    event :publish do
      transition new: :public, if: ->(auction) { auction.description.present? }
    end

    event :close do
      transition public: :closed
    end

    event :win do
      transition public: :won, if: ->(auction) { auction.actual_price != auction.minimum_price && auction.winner.present? }
    end

    event :republish do
      transition closed: :public
    end
  end

end
