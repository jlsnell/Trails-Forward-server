When /^I bid ([0-9]+) on the unowned megatile$/ do |money|
  @response = post world_megatile_bids_path(@world, @unowned_megatile), 
    :format => :json, 
    :auth_token => @user.authentication_token,    
    :money => money
end

Then /^I should get a bid id$/ do
  data = ActiveSupport::JSON.decode(@response.body)
  data.has_key?("bid").should be true
  data["bid"].has_key?("id").should be true
end
