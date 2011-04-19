class RemoveDensityAndSpeciesFromResourceTile < ActiveRecord::Migration
  def self.up
    remove_column :resource_tiles, :density
    remove_column :resource_tiles, :species
    remove_column :resource_tiles, :quality
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
