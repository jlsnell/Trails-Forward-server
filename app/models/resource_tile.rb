class ResourceTile < ActiveRecord::Base
  versioned
  belongs_to :megatile
  belongs_to :world
end
