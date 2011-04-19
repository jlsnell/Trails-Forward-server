class AddOccupantsToResourceTile < ActiveRecord::Migration
  def self.up
    add_column :resource_tiles, :primary_use, :string
    add_column :resource_tiles, :people_density, :float
    add_column :resource_tiles, :housing_density, :float
    add_column :resource_tiles, :tree_density, :float
    add_column :resource_tiles, :tree_species, :string
    add_column :resource_tiles, :development_intensity, :float
  end

  def self.down
    remove_column :resource_tiles, :development_intensity
    remove_column :resource_tiles, :tree_species
    remove_column :resource_tiles, :tree_density
    remove_column :resource_tiles, :housing_density
    remove_column :resource_tiles, :people_density
    remove_column :resource_tiles, :primary_use
  end
end
