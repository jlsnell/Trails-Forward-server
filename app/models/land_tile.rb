class LandTile < ResourceTile
  #there doesn't seem to be a way to have extension follow inheritance
  api_accessible :resource_base do |template|
    template.add :id
    template.add :x
    template.add :y
    template.add :type
    template.add :updated_at
  end

  api_accessible :resource, :extend => :resource_base do |template|
    template.add :primary_use
    template.add :zoned_use
    template.add :people_density
    template.add :housing_density
    template.add :tree_density
    template.add :tree_species
    template.add :development_intensity
  end
end