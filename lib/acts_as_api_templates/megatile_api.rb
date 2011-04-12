require "#{RAILS_ROOT}/app/models/megatile.rb"
 
Megatile.api_accessible :megatile_with_resources do |template|
  template.add :id
  template.add :x
  template.add :y
  template.add lambda{|m| m.owner ? m.owner.id : "foo"}, :as => :owner_id
  #template.add :owner, :template => :id_and_name
  template.add :updated_at
  template.add :resource_tiles, :template => :resource
end

Megatile.api_accessible :megatiles_with_resources, :extend => :megatile_with_resources
