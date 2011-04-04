class Bid < ActiveRecord::Base
  belongs_to :bidder, :class_name => 'Player'
  belongs_to :current_owner, :class_name => 'Player'
  belongs_to :listing
  
  belongs_to :counter_to, :class_name => 'Bid'
  has_many :counter_bids, :class_name => 'Bid', :foreign_key => 'counter_to_id'

  # land offered as PAYMENT on a listing
  belongs_to :offered_land, :class_name => "MegatileGrouping"
  
  #land that is being PURCHASED by the bidder. In the case of a fully solicited buy, this == listing.megatile_grouping.meagtiles
  belongs_to :requested_land, :class_name => "MegatileGrouping"
  
  Verbiage = {:active => "Offered",
              :offered => "Offered",
              :accepted => "Accepted",
              :rejected => "Rejected",
              :cancelled => "Cancelled"
  }
  
  def is_active?
    self.status == Verbiage[:active]
  end
end
