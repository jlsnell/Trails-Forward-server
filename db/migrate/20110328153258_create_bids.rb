class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.integer :listing_id
      t.integer :bidder_id
      t.integer :current_owner_id
      t.integer :money
      t.integer :offered_land_id
      t.integer :requested_land_id
      t.string  :status, :default => "Offered"

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
