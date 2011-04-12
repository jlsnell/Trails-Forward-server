class AddOptimisticLocksToBidListingMegatilePlayer < ActiveRecord::Migration
  def self.up
    add_column :bids, :lock_version, :integer, :default => 0
    add_column :listings, :lock_version, :integer, :default => 0
    add_column :megatiles, :lock_version, :integer, :default => 0
    add_column :players, :lock_version, :integer, :default => 0
    add_column :resource_tiles, :lock_version, :integer, :default => 0
  end

  def self.down
    remove_column :bids, :lock_version
    remove_column :listings, :lock_version
    remove_column :megatiles, :lock_version
    remove_column :players, :lock_version
    remove_column :resource_tiles, :lock_version
  end
end
