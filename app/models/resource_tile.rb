class ResourceTile < ActiveRecord::Base
  versioned
  acts_as_api
  
  belongs_to :megatile
  belongs_to :world
  
  def clear_resources
    self.type = nil
    self.species = nil
    self.quality = nil
  end
  
  def clear_resources!
    save!
  end
  
  api_accessible :resource do |template|
    template.add :id
    template.add :x
    template.add :y
    template.add :type
    template.add :species
    template.add :quality
    template.add :zoned_use
    template.add :updated_at
  end
  
end
