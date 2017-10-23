local cloud = ents.Derive("base")


function cloud:setDrawParam(_largeurWindow, _xPath, _x, _vitesse)
  cloud.largeurWindow = _largeurWindow  -- largeur de la page
  cloud.xPath = _xPath                  -- x-position du nuage toujours > 0
  cloud.x = _x                          -- x-position du nuage sur la page (pas toujours > 0)
  cloud.vitesse = _vitesse              -- pondération de la vitesse
end


function cloud:setSize(width, height)
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
  return love.graphics.setColor(cloud.red, cloud.green, cloud.blue)
end


function cloud:update(dt)
  cloud.xPath = (cloud.xPath + cloud.vitesse*dt) % (cloud.largeurWindow + cloud.width);
  cloud.x = cloud.xPath - cloud.width;
end

function cloud:draw()
  cloud:getColor()
  love.graphics.rectangle("fill", cloud.x, cloud.y, cloud.width, cloud.height)  
end

return cloud
