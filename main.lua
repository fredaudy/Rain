-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end



function love.load()  
  require("entities")
  ents.Startup()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight() 
  
  local cloud1 = ents.Create("cloud", 0, hauteur/5)
  cloud1.setColor(91, 185, 205)
  cloud1.setSize(250, 100)

--  cloud1 = Cloud(largeur, 250, 0, 0, 128)
  cloud2 = Cloud(largeur, 150, 100, 0, 64)
--  largeurCloud = 250
--  borneCloud = 0
--  xCloud = 0
end

function love.update(dt)

--  cloud1:pos(dt);
  cloud2:pos(dt);
--  borneCloud = (borneCloud + 128*dt) % (largeur + largeurCloud);
--  xCloud = borneCloud - largeurCloud;
  
  ents.update(dt)
end

function love.draw()
  love.graphics.setColor(91, 185, 205)
  love.graphics.rectangle("fill", 0, 0, largeur, hauteur/2)
  
  love.graphics.setColor(  215, 189, 226 )
  love.graphics.rectangle("fill", cloud2.xPos, hauteur/10, cloud2.largeur, 80) 
  
--  love.graphics.setColor( 235, 222, 240 )
--  love.graphics.rectangle("fill", cloud1.xPos, hauteur/5, cloud1.largeur, 100)  
  
  
  love.graphics.setColor( 22, 160, 133)
  love.graphics.rectangle("fill", 0, hauteur/2, largeur, hauteur/2)
  
  ents.draw()
end

function love.keypressed(key)
  
  print(key)
  
end


function Cloud(_largeurWindow, _largeur, _xPath, _xPos, _vitesse)
  
  local object = {}
  
  object.largeurWindow = _largeurWindow  -- largeur de la page
  object.largeur = _largeur              -- largeur du nuage
  object.xPath = _xPath                  -- x-position du nuage toujours > 0
  object.xPos = _xPos                    -- x-position du nuage sur la page (pas toujours > 0)
  object.vitesse = _vitesse              -- pondération de la vitesse
  
  function object:pos(deltat)
    object.xPath = (object.xPath + object.vitesse*deltat) % (object.largeurWindow + object.largeur);
    object.xPos = object.xPath - object.largeur;
  end
  
  return object
end
