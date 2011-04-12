class ResourceTile < ActiveRecord::Base
  versioned
  acts_as_api
  
  belongs_to :megatile
  belongs_to :world
  
  def clear_resources!
    self.type = nil
    self.species = nil
    self.quality = nil
    save!
  end
  
end
