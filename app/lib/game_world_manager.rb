require 'singleton'

class GameWorldManager
  attr_reader :world
  attr_reader :the_state
  attr_reader :broker
  
  def initialize(world)
    @world = world
    @the_state = TheState.new world
    @broker = Broker.new world
  end
  
  def self.for_world(world)
    #see end of this file
    GameWorldManagerFactory.instance.manager_for_world(world)
  end
  
  def self.for_world_id(world_id)
    GameWorldManagerFactory.instance.manager_for_world_id(world_id)
  end
  
end



class GameWorldManagerFactory
  include Singleton
  
  def initialize
    @managers = {}
  end
  
  def manager_for_world(world)
    if not (@managers.has_key? world)
      @managers[world] = GameWorldManager.new(world)
      @managers[world.id] = @managers[world]
    end
    
    @managers[world.id]
  end
  
  def manager_for_world_id(world_id)
    if @managers.has_key? world_id
      return @managers[world_id]
    else
      world = World.find(world_id)
      return manager_for_world(world)
    end
  end
end