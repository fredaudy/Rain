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
  
  local cloud2 = ents.Create("cloud", 0,  hauteur/10)
  cloud2:setColor(215, 189, 226)
  cloud2:setSize(150, 80)
  cloud2:setDrawParam(largeur, 100, 0, 64)
  
  local cloud1 = ents.Create("cloud", 0, hauteur/5)
  cloud1:setColor(235, 222, 240)
  cloud1:setSize(250, 100)
  cloud1:setDrawParam(largeur, 0, 0, 128)
  
  local rain = ents.Create("rain", 0, hauteur/5)
  rain:fromCloud(cloud1)
  rain:setColor(39, 147, 227)
  rain:setSize(10, 25)
  rain:setDrawParam(largeur, 0, 0, 128, 96)
  
  local flame1 = ents.Create("flame", 0, hauteur/3)
  flame1:setColor(222, 173, 69)
  flame1:setSize(20, 20)
  flame1:setDrawParam(largeur, 0, 0, 160)
  
end

function love.update(dt)  
  ents.update(dt)
end

function love.draw()
  love.graphics.setColor(91, 185, 205)
  love.graphics.rectangle("fill", 0, 0, largeur, hauteur/2)  
  
  love.graphics.setColor( 22, 160, 133)
  love.graphics.rectangle("fill", 0, hauteur/2, largeur, hauteur/2)
  
  ents.draw()
end

function love.keypressed(key)
  
  print(key)
  
end
