class Auction < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence => true
  validates :minimum_price, :presence => true
end
