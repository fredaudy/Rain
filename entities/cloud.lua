local cloud = ents.Derive("base")
cloud.width = 0
cloud.height = 0


function cloud:setDrawParam(_largeurWindow, _xPath, _xPos, _vitesse)
  cloud.largeurWindow = _largeurWindow  -- largeur de la page
--  cloud.largeur = _largeur              -- largeur du nuage
  cloud.xPath = _xPath                  -- x-position du nuage toujours > 0
  cloud.xPos = _xPos                    -- x-position du nuage sur la page (pas toujours > 0)
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
  cloud.xPos = cloud.xPath - cloud.width;
end

function cloud:draw()
  cloud:getColor()
  love.graphics.rectangle("fill", cloud.xPos, cloud.y, cloud.width, cloud.height)  
end

return cloud
