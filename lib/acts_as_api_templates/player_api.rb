require "#{RAILS_ROOT}/app/models/player.rb"
 
Player.api_accessible :id_and_name do |template|
  template.add :id
  #template.add 'user.name', :as => :name
  template.add :type
end

