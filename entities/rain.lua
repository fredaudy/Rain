local ent = ents.Derive("base")

function ent:setDrawParam(_largeurWindow, _xPath, _x, _vitesseHorizontale, _vitesseVerticale)
  ent.largeurWindow = _largeurWindow                  -- largeur de la page
  ent.xPath = _xPath                                  -- x-position du nuage toujours > 0
  ent.x = _x                                    -- x-position du nuage sur la page (pas toujours > 0)
  ent.vitesseHorizontale = _vitesseHorizontale        -- pondération de la vitesse
  ent.vitesseVerticale = _vitesseVerticale  or 0      -- pondération de la vitesse
end

function ent:fromCloud(cloud)
  ent.cloud = cloud
  ent.x, ent.y = cloud.getPos()
  ent.y = ent.y + cloud.height
end

function ent:setSize(width, height)
  ent.width = width
  ent.height = height
end

function ent:getSize()
  return ent.width, ent.height
end

function ent:setColor(red, green, blue)
  ent.red = red
  ent.green = green
  ent.blue = blue
end

function ent:getColor()
  return love.graphics.setColor(ent.red, ent.green, ent.blue)
end


function ent:update(dt)
  ent.xPath = (ent.xPath + ent.vitesseHorizontale*dt) % (ent.largeurWindow + ent.width);
  ent.x = ent.xPath - ent.width;
  
  ent.y = ent.y + ent.vitesseVerticale*dt
end

function ent:draw()
  ent:getColor()
  love.graphics.rectangle("fill", ent.x, ent.y, ent.width, ent.height)  
end

return ent