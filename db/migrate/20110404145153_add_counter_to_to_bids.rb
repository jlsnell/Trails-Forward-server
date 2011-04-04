class AddCounterToToBids < ActiveRecord::Migration
  def self.up
    add_column :bids, :counter_to_id, :integer
  end

  def self.down
    remove_column :bids, :counter_to_id
  end
end
