class CreateMegatileGroupingMegatiles < ActiveRecord::Migration
  def self.up
    create_table :megatile_grouping_megatiles do |t|
      t.integer :megatile_grouping_id
      t.integer :megatile_id
      t.timestamps
    end
  end

  def self.down
    drop_table :megatile_grouping_megatiles
  end
end
