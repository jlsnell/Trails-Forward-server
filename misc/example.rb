world = World.create do |w|
  w.name = "Example World #{rand(100000)}"
  w.year_start = 1880
  w.year_current = 1880
  w.width = 30
  w.height = 30
  w.megatile_width = 3
  w.megatile_height = 3
end

puts "Created '#{world.name}' with id #{world.id}"

puts "Spawning empty tiles"
world.spawn_tiles true
puts "\t...done"

how_many_trees = (world.width * world.height * 0.80).round
print "Placing  trees"
STDOUT.flush

how_many_trees.times do |i|
  x = rand world.width
  y = rand world.height
  resource_tile = world.resource_tile_at x,y
  resource_tile.type = 'TreeTile'
  resource_tile.quality = rand(40)
  resource_tile.save
  print '.'
  STDOUT.flush
end
puts ''

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

print "Assigning starter property"
((world.width / 3) * (world.height / 3)).times do 
  x = rand world.width
  y = rand world.height
  megatile = world.megatile_at x,y
  megatile.owner = players[rand(players.size)]
  megatile.save
  print "."
  STDOUT.flush
end
puts ""

