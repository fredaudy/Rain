local cloud = ents.Derive("base")
cloud.width = 0
cloud.height = 0
cloud.red = 255
cloud.green = 255
cloud.blue = 255

function cloud:setSize(width, heigth)
  cloud.width = width
  cloud.height = height
end

function cloud:getSize()
  return cloud.width, cloud.height
end

function cloud:setColor(red, green, blue)
  cloud.red = red
  cloud.green = green
  cloud.blue = blue
end

function cloud:getColor()
  return cloud.red, cloud.green, cloud.blue
end


function cloud:udpdate(dt)
  
end

function cloud:draw()
  
end

return cloud
