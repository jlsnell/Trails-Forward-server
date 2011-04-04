class Player < ActiveRecord::Base
  has_many :megatiles, :inverse_of => :owner
  has_many :resource_tiles, :through => :megatiles
  belongs_to :world
  belongs_to :user  
end
