class AddWinnerToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :winner_id, :integer
  end
  def self.down
    remove_column :auctions, :winner_id
  end
end
