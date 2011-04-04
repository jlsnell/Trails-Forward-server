class CreateMegatileGroupings < ActiveRecord::Migration
  def self.up
    create_table :megatile_groupings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :megatile_groupings
  end
end
