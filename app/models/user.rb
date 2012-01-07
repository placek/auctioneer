class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  has_many :auctions

  scope :email_like, ->(email) { where('users.email like ?', email) }
end
