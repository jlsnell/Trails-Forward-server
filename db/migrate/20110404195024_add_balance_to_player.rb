class AddBalanceToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :balance, :integer
  end

  def self.down
    remove_column :players, :balance
  end
end
