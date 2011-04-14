class AddDensityToResourceTile < ActiveRecord::Migration
  def self.up
    add_column :resource_tiles, :density, :integer
  end

  def self.down
    remove_column :resource_tiles, :density
  end
end
