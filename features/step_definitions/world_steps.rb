require Rails.root.join("lib/example_world_builder")

Given /^I have a world$/ do
  @world = ExampleWorldBuilder.build_example_world 6, 6
end

Given /^I have an unowned megatile in the world$/ do
  @unowned_megatile = @world.megatiles.where(:owner_id => nil).first
end
