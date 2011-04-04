class Listing < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Player'
  belongs_to :megatile_grouping
  has_many :bids
  has_one :accepted_bid, :class_name => "Bid"
  
  Verbiage = {:active => "Active",
              :cancelled => "Cancelled",
              :sold => "Sold"
  }
  
  def is_active?
    self.status == Verbiage[:active]
  end
  
end
