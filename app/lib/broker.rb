require 'set'

class Broker
  
  TrumpedBid = "Another transaction affected the land included in this bid"
  TrumpedListing = "Another transaction affected the land included in this listing"
  
  def initialize(world)
    @world = world
  end
  
  def register_bid(bid)
  end
  
  def execute_sale(bid)
    ActiveRecord::Base.transaction do
      raise "Can't process a sale for an unaccepted bid" unless bid.status == "Accepted"
    
      transfer_assets(bid)
    
      if bid.listing  #this wasn't unsolicited
        bid.listing.bids.each do |bid_to_reject|
          reject_bid(bid_to_reject, "Other bid accepted") unless bid_to_reject == bid
        end
      end
    
      megatiles_purchased =  bid.requested_land.megatiles
      
      if bid.offered_land
        megatiles_paid = bid.offered_land.megatiles    
        megatiles_affected = Set.new.union(megatiles_purchased).union(megatiles_paid)
      else
        megatiles_affected = megatiles_purchased
      end
      
      #cancel bids on other listings that contain megatiles purchased this bid
      #and cancel bids made on land *paid* as part of this transaction
      # then
      #revoke listings on land paid in this transaction  
      #and revoke other listings that include purchased land
      megatiles_affected.each do |mt|
        mt.bids_on.each do |other_bid|
          cancel_bid(other_bid, TrumpedBid) unless other_bid == bid
        end
      
        mt.bids_offering.each do |other_bid|
          cancel_bid(other_bid, TrumpedBid) unless other_bid == bid
        end
      
        mt.listings.each do |other_listing|
          cancel_listing(other_listing, TrumptedListing) unless other_listing == bid.listing
        end
      end    
    end #transaction
  end
  
  def transfer_assets(bid)
    if bid.listing  #this wasn't unsolicited
      bid.listing.status = Listing::Verbiage[:sold]
      bid.listing.save
      #any hooks to notify listing owner go here
    end
    
    #any hooks to notify buyer go here

    #I gotsta get paid
    bid.bidder.balance -= bid.money
    bid.current_owner.balance += bid.money
    
    #transfer property
    if bid.offered_land 
      bid.offered_land.megatiles.each do |mt|
        mt.owner = bid.current_owner
        mt.save
      end      
    end
    
    bid.requested_land.megatiles.each do |mt|
      mt.owner = bid.bidder
      mt.save
    end
    
    bid.save
    
  end

  def reject_bid(rejected_bid, explanation)
    if bid.is_active?
      bid.status = Bid::Verbiage[:rejected]
      bid.rejection_reason = explanation
      #any hooks and such go here
      
      bid.save
    end
  end
  
  def cancel_bid(cancelled_bid, explanation)
    if bid.is_active? 
      bid.status = Bid::Verbiage[:cancelled]
      bid.rejection_reason = explanation
      #any hooks and such go here
      
      bid.save
    end
  end
  
  def cancel_listing(listing, explanation)
    if listing.is_active?
      listing.status = Listing::Verbiage[:cancelled]
      listing.save
    end
  end

  
end