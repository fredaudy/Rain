ents = {}
ents.objects = {}               -- objects collection
ents.objectPath = "entities/"   -- path to folder of objects-templates
local register = {}             -- objects-templates collection
local id = 0

function ents.Startup()
  register["cloud"] = love.filesystem.load(ents.objectPath .. "cloud.lua")
  register["flame"] = love.filesystem.load(ents.objectPath .. "flame.lua")
  register["rain"] = love.filesystem.load(ents.objectPath .. "rain.lua")
end

-- load & launch alua script
function  ents.Derive(name)
  return love.filesystem.load(ents.objectPath .. name .. ".lua")()
end


function ents.Create(name, x, y)
  x = x or 0
  
  y = y or 0
  
  if register[name] then
    id = id + 1
    local ent = register[name]()
    ent:load()
    ent:setPos(x, y)
    ent.id = id
    ents.objects[#ents.objects +1] = ent
    return ents.objects[#ents.objects]
  else
    print ("ERROR the entity " .. name .. " got no template register !")
    return false
  end
  
end

function ents.destroy(id)
  
  if  ents.objects[id] then
    if ents.objects[id].die then
      ents.objects[id]:die()
    end
    ents.objects[id] = nil
  end
  
end


function ents.update(dt)
  for i, ent in pairs(ents.objects) do
    if ent.update then
      ent:update(dt)
    end    
  end  
end

function ents.draw()
  for i, ent in pairs(ents.objects) do
    if ent.draw then
      ent:draw()
    end    
  end
end

