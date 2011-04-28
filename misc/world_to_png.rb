require 'chunky_png'

world = World.find ARGV[0]
canvas = ChunkyPNG::Image.new world.width, world.height, ChunkyPNG::Color::TRANSPARENT

world.width.times do |x|
  world.height.times do |y|
    rt = world.resource_tile_at x,y
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

