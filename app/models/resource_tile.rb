class ResourceTile < ActiveRecord::Base
  versioned
  acts_as_api
  
  belongs_to :megatile
  belongs_to :world
  
  validates_uniqueness_of :x, :scope => [:y, :world_id]
  validates_uniqueness_of :y, :scope => [:x, :world_id]
  
  #todo: Add validations for tree_species, zoned_use, and primary_use to be sure that they're in one of the below
  
  Verbiage = {:tree_species => {
                :coniferous => "Coniferous",
                :deciduous => "Deciduous",
                :mixed => "Mixed"
               },
              :zoned_uses => {
                :development => "Development",
                :dev => "Development",
                :agriculture => "Agriculture",
                :ag => "Agriculture",
                :logging => "Logging"
              },
              :primary_uses => {
                :pasture => "Agriculture/Pasture",
                :crops => "Agriculture/Cultivated Crops",
                :housing => "Housing",
                :logging => "Logging",
                :industry => "Industry",
              }
             }
  
  
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
