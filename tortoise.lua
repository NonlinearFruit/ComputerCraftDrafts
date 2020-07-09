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

function Tortoise:down(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.down()
  end
end

function Tortoise:forward(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.forward()
  end
end

function Tortoise:back(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.back()
  end
end

function Tortoise:clockwise(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.turnRight()
  end
end

function Tortoise:widdershins(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.turnLeft()
  end
end

return Tortoise
