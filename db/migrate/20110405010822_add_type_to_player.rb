class AddTypeToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :type, :string
  end

  def self.down
    remove_column :players, :type
  end
end
