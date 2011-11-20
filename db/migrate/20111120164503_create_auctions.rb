class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions do |t|
      t.string  :title
      t.string  :actual_price
      t.string  :minimum_price
      t.text    :description
      t.integer :user_id

      t.timestamps
    end
  end
end
