class CreateWorlds < ActiveRecord::Migration
  def self.up
    create_table :worlds do |t|
      t.string :name
      t.integer :year_start
      t.integer :year_current
      t.integer :height
      t.integer :width
      t.integer :megatile_width
      t.integer :megatile_height

      t.timestamps
    end
  end

  def self.down
    drop_table :worlds
  end
end
