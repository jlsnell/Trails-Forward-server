class Player < ActiveRecord::Base
  versioned
  acts_as_api
  
  has_many :megatiles, :inverse_of => :owner, :foreign_key => 'owner_id'
  has_many :resource_tiles, :through => :megatiles
  belongs_to :world
  belongs_to :user  
end
