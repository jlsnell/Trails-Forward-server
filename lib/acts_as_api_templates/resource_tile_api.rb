require "#{RAILS_ROOT}/app/models/resource_tile.rb"

ResourceTile.api_accessible :resource do |template|
  template.add :id
  template.add :x
  template.add :y
  template.add :type
  template.add :species
  template.add :quality
  template.add :zoned_use
  template.add :updated_at
end