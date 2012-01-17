class Auction < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :minimum_price, presence: true

  scope :created, where(state: :new)
  scope :public, where(state: :public)
  scope :closed, where(state: :closed)
  scope :won, where(state: :won)
  scope :finished, where('state = "closed" OR state = "won"')

  # method used in search engine
  def self.search(query)
    if query
      where('(title LIKE ?) OR (description LIKE ?)', "%#{query}%", "%#{query}%")
    else
      scoped
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
      transition public: :won, if: ->(auction) { auction.actual_price != auction.minimum_price }
    end

    event :republish do
      transition closed: :public
    end
  end
end
