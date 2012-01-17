class ChangePriceColumnsToFloatType < ActiveRecord::Migration
  def self.up
    change_column :auctions, :minimum_price, :float
    change_column :auctions, :actual_price, :float
  end

  def self.down
    change_column :auctions, :minimum_price, :string
    change_column :auctions, :actual_price, :string
  end
end
