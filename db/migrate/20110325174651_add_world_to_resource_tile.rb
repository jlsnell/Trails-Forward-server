class AddWorldToResourceTile < ActiveRecord::Migration
  def self.up
    add_column :resource_tiles, :world_id, :integer
  end

  def self.down
    remove_column :resource_tiles, :world_id
  end
end
