class AddImperviousnessToResourceTile < ActiveRecord::Migration
  def self.up
    add_column :resource_tiles, :imperviousness, :float
  end

  def self.down
    remove_column :resource_tiles, :imperviousness
  end
end
