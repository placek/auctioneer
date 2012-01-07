class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :timeoutable
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  scope :email_like, ->(email) { where('admins.email like ?', email) }
end
