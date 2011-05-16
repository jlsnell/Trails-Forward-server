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
