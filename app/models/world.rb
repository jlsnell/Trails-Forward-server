class World < ActiveRecord::Base
  has_many :megatiles
  has_many :resource_tiles
  has_many :players
  
  validates :height, :numericality => {:greater_than => 0}
  validates :width, :numericality => {:greater_than => 0}
  validates :megatile_width, :numericality => {:greater_than => 0}
  validates :megatile_height, :numericality => {:greater_than => 0}

  validate :world_dimensions_are_consistent

  def world_dimensions_are_consistent
    errors.add(:width, "must be a multiple of megatile_width") unless (width % megatile_width == 0) 
    errors.add(:height, "must be a multiple of megatile_height") unless (height % megatile_height == 0)
  end

  
  def spawn_tiles
    if valid?
      Range.new(0,width-1).step(megatile_width) do |x|
        Range.new(0,height-1).step(megatile_height) do |y|
          mt = Megatile.new(:x => x, :y => y, :world => self)
          mt.save
          mt.spawn_resources
        end
      end      
    else
      raise "Can't spawn tiles for an invalid World"
    end
  end

  def megatile_at(x,y)
    resource_tile_at(x,y).megatile
  end
  
  def resource_tile_at(x,y)
    ResourceTile.where(:world_id => self.id).where(:x => x).where(:y => y).limit(1)[0]
  end
  
  def manager
    GameWorldManager.for_world(self)
  end
  
end
