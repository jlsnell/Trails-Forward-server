class AddWorldToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :world_id, :integer
  end

  def self.down
    remove_column :players, :world_id
  end
end
