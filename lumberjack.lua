local Lumberjack = {}

function Lumberjack:new(t)
  newObj = {}
  self.__index = self
  self.turtle = t
  return setmetatable(newObj, self)
end

function Lumberjack:fell()
  while(self.turtle.detectUp()) do
    self.turtle.digUp()
    self.turtle.up()
  end

  while (not self.turtle.detectDown()) do 
    self.turtle.down()
  end
end

if select(1, ...) ~= "lumberjack" then
  require "bootstrapper"
  local lumberjack = getLumberjack()
  lumberjack.fell()
end
  
return Lumberjack
