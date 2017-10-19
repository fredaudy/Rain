ents = {}
ents.objects = {}               -- objects collection
ents.objectPath = "entities/"   -- path to folder of objects-templates
local register = {}             -- objects-templates collection
local id = 0

function ents.Startup()
  register["cloud"] = love.filesystem.load(ents.objectPath .. "cloud.lua")
end

-- load & launch alua script
function  ents.Derive(name)
  return love.filesystem.load(ents.objectPath .. name .. ".lua")()
end


function ents.Create(name, x, y)
  if not x then
    x = 0
  end
  
  if not y then
    y = 0
  end
  
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

function ents.update(dt)
  for i, ent in pairs(ents.objects) do
    if ent.update then
      ent.update(dt)
    end    
  end  
end

function ents.draw()
  for i, ent in pairs(ents.objects) do
    if ent.draw then
      ent.draw()
    end    
  end
end

