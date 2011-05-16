Given /^I have a player in the world$/ do
  @player = Developer.new do |p|
    p.user = @user
    p.world = @world
    p.balance = Player::DefaultBalance
  end
  @player.save!
end
