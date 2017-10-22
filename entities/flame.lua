local entity = ents.Derive("base")
entity.width = 0
entity.height = 0

function entity:setPos(x, y)
  self.x = x
  self.y = y
  self.fixed_y = y
end

function entity:setDrawParam(_largeurWindow, _xPath, _xPos, _vitesse)
  self.largeurWindow = _largeurWindow  -- largeur de la page
  self.xPath = _xPath                  -- x-position du nuage toujours > 0
  self.xPos = _xPos                    -- x-position du nuage sur la page (pas toujours > 0)
  self.vitesse = _vitesse              -- pondération de la vitesse
end

function entity:setSize(width, height)
  self.width = width
  self.height = height
end

function entity:getSize()
  return self.width, self.height
end

function entity:setColor(red, green, blue)
  self.red = red
  self.green = green
  self.blue = blue
end

function entity:getColor()
  return love.graphics.setColor(self.red, self.green, self.blue)
end


function entity:update(dt)
  self.xPath = (self.xPath + self.vitesse*dt) % (self.largeurWindow + self.width);
  self.xPos = self.xPath - self.width;
  
  self.y = self.fixed_y+math.sin(self.xPos/30)*20;
end

function entity:draw()
  self:getColor()
  love.graphics.rectangle("fill", self.xPos, self.y, self.width, self.height)  
end

return entity
