class AddAcceptedBidToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :bid_id, :integer
  end

  def self.down
    remove_column :listings, :bid_id
  end
end
