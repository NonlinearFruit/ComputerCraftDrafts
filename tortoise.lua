local Tortoise = {}
local turtle

function Tortoise:new(t)
  newObj = {}
  self.__index = self
  self.turtle = t
  return setmetatable(newObj, self)
end

function Tortoise:up(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.up()
  end
end

return Tortoise
