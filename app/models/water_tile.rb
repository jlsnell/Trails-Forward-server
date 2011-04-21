class WaterTile < ResourceTile
  validate :should_not_have_land_properties
  
  def should_not_have_land_properties
    errors.add(:people_density, "illegal for water tiles") if people_density
    errors.add(:housing_density, "illegal for water tiles") if housing_density
    errors.add(:development_intensity, "illegal for water tiles") if development_intensity
  end 

  #there doesn't seem to be a way to have extension follow inheritance
  api_accessible :resource do |template|
    template.add :id
    template.add :x
    template.add :y
    template.add :tree_density
    template.add :tree_species
    template.add :type
    template.add :updated_at
  end

end