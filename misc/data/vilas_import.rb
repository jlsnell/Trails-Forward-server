require 'csv'

def handle_row(row, indices, world)
  x = row[ indices[:row] ].to_i
  y = row[ indices[:col] ].to_i
  
  class_code = row[ indices[:cover_class] ].to_i
  if class_code == 255
    #no data here, just leave it a null tile
    return
  else 
    resource_tile = world.resource_tile_at x,y
    resource_tile.clear_resources
    case class_code  #most significant digit of class code
    when 11,95  #open water or emergent herbaceous wetlands
      resource_tile.type = WaterTile.to_s
    when 21..24 #developed
      resource_tile.type = BuildingTile.to_s
      devel_density = row[ indices[:devel_density] ].to_i
      resource_tile.density = case devel_density 
        when 0,99 then 0
        when 1..6 then 2**devel_density
      end
    when 41..71,90 #forest, scrub, herbaceous
      resource_tile.type = TreeTile.to_s
      resource_tile.density = row[ indices[:forest_density] ].to_i
      resource_tile.species = case class_code
        when 41 then "Deciduous"
        when 42 then "Coniferous"
        when 43 then "Mixed"
      end     
    when 81..82 #pasture or crops
      resource_tile.type = FarmTile.to_s
      resource_tile.species = case class_code
        when 81 then "Pasture"
        when 82 then "Cultivated Crops"
      end 
    end
    resource_tile.save!
  end 
end


world = World.create do |w|
  w.name = "Vilas County, WI #{rand(100000)}"
  w.year_start = 2000
  w.year_current = 2001
  w.width = 1353
  w.height = 714
  w.megatile_width = 3
  w.megatile_height = 3
end

puts "Created '#{world.name}' with id #{world.id}"

puts "Spawning empty tiles"
world.spawn_tiles false #make true for debug output
puts "\t...done"

# how_many_trees = (world.width * world.height * 0.80).round
# print "Placing  trees"
# STDOUT.flush

# how_many_trees.times do |i|
#   x = rand world.width
#   y = rand world.height
#   resource_tile = world.resource_tile_at x,y
#   resource_tile.type = 'TreeTile'
#   resource_tile.quality = rand(40)
#   resource_tile.save
#   print '.'
#   STDOUT.flush
# end
# puts ''

puts "Creating users and players..."
players = []
player_types = [Lumberjack, Developer, Conserver]
3.times do |i|
  u = User.create :name => "User #{world.id}-#{i}"
  p = player_types[i].create :user => u, :world => world, :balance => 1000
  # p.type = player_types[i]
  #   p.save
  players << p
  puts "\tPlayer id #{p.id} (#{p.type}) created"
end

# print "Assigning starter property"
# ((world.width / 3) * (world.height / 3)).times do 
#   x = rand world.width
#   y = rand world.height
#   megatile = world.megatile_at x,y
#   megatile.owner = players[rand(players.size)]
#   megatile.save
#   print "."
#   STDOUT.flush
# end
# puts ""

reader = CSV.open("misc/data/vilas_conserv_game_spatial_1_acre_inputs.csv", "r")
header = reader.shift
indices = {:row => header.index("ROW"), :col => header.index("COL"), :cover_class => header.index("LANDCOV2001"), :devel_density => header.index("HDEN00"), :forest_density => header.index("CANOPY%2001")}
reader.each{|row| handle_row(row, indices, world)}
