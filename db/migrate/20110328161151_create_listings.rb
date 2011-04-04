class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :owner_id
      t.integer :megatile_grouping_id
      t.integer :price
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
