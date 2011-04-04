class CreateMegatiles < ActiveRecord::Migration
  def self.up
    create_table :megatiles do |t|
      t.integer :world_id
      t.integer :x
      t.integer :y
      t.integer :owner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :megatiles
  end
end
