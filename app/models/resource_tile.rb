class ResourceTile < ActiveRecord::Base
  versioned
  acts_as_api
  
  belongs_to :megatile
  belongs_to :world
  
  def clear_resources
    self.primary_use = nil
    self.people_density = nil
    self.housing_density = nil
    self.tree_density = nil
    self.tree_species = nil
    self.development_intensity = nil
  end
  
  def clear_resources!
    clear_resources
    save!
  end
  
  api_accessible :resource_base do |template|
    template.add :id
    template.add :x
    template.add :y
    template.add :type
    template.add :updated_at
  end
  
end
