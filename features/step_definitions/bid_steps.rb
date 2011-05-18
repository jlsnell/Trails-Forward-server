When /^I bid (-?[0-9]+) on the unowned megatile$/ do |money|
  @response = post world_megatile_bids_path(@world, @unowned_megatile), 
    :format => :json, 
    :auth_token => @user.authentication_token,    
    :money => money
end

When /^I bid (-?[0-9]+) on the owned megatile$/ do |money|
  @response = post world_megatile_bids_path(@world, @owned_megatile), 
    :format => :json, 
    :auth_token => @user.authentication_token,    
    :money => money
end

Given /^a bid has been placed on that owned megatile$/ do
  @other_player = @world.players.where(Player.arel_table[:id].not_eq(@player.id)).first

  @other_user = @other_player.user
  @response = post world_megatile_bids_path(@world, @my_megatile), 
    :format => :json, 
    :auth_token => @other_user.authentication_token,    
    :money => 42
  biddata = ActiveSupport::JSON.decode(@response.body)
  biddata.has_key?("bid").should be true
  biddata["bid"].has_key?("id").should be true
end

Given /^I can see the bids on that owned megatile$/ do
  @response = get world_megatile_bids_path(@world, @my_megatile), 
    :format => :json, 
    :auth_token => @user.authentication_token
  bidsdata = ActiveSupport::JSON.decode(@response.body)
  bidsdata.has_key?("bids").should be true
  
  bidsdata["bids"].each do |biddata|
    biddata.has_key?("id").should be true
    biddata.has_key?("money").should be true
    biddata.has_key?("bidder").should be true
  end    
end


Then /^I should get a bid id$/ do
  data = ActiveSupport::JSON.decode(@response.body)
  data.has_key?("bid").should be true
  data["bid"].has_key?("id").should be true
end

Then /^I should not get a bid id$/ do
  #puts "Got a response back with the following body: #{@response.body}"
  data = ActiveSupport::JSON.decode(@response.body)
  data.has_key?("bid").should_not be true
end
