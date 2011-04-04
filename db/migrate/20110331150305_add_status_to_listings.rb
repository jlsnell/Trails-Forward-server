class AddStatusToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :status, :string
  end

  def self.down
    remove_column :listings, :status
  end
end
