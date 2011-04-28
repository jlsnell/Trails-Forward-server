class AddTreeSizeToResourceTile < ActiveRecord::Migration
  def self.up
    add_column :resource_tiles, :tree_size, :float
  end

  def self.down
    remove_column :resource_tiles, :tree_size
  end
end
