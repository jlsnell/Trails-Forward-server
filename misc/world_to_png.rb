require 'chunky_png'

world = World.find ARGV[0]
canvas = ChunkyPNG::Image.new world.width, world.height, ChunkyPNG::Color::TRANSPARENT

ResourceTile.where(:world_id => world.id).find_in_batches do |group|
  group.each do |rt|
    x = rt.x
    y = rt.y
    case rt.type
      when WaterTile.to_s
        canvas[x,y] = ChunkyPNG::Color :blue
      when LandTile.to_s
        color = ChunkyPNG::Color(:green, rt.tree_density)
        canvas[x,y] = color 
    end
  end
end

canvas.save ARGV[1]

