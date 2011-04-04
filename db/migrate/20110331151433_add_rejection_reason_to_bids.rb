class AddRejectionReasonToBids < ActiveRecord::Migration
  def self.up
    add_column :bids, :rejection_reason, :string
  end

  def self.down
    remove_column :bids, :rejection_reason
  end
end
