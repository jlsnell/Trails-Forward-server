class AddDefaultActiveToListingStatus < ActiveRecord::Migration
  def self.up
    change_column_default :listings, :status, "Active"
  end

  def self.down
    change_column_default :listings, :status, nil
  end
end
