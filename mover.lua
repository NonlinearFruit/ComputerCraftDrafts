local Mover = {}

function Mover:new(t, i)
  newObj = {}
  self.__index = self
  self.turtle = t
  self.io = i
  return setmetatable(newObj, self)
end

function Mover:up(count)
  local count = count or 1
  for i = 1, count do
    if not self.turtle.up() then
      self.turtle.digUp()
      if not self.turtle.up() then
        self.io.read()
        self.turtle.refuel(100)
      self.turtle.up()
    end
  end
end
end

function Mover:down(count)
  local count = count or 1
  for i = 1, count do
    if not self.turtle.down() then
      self.turtle.digDown()
      if not self.turtle.down() then
        self.io.read()
        self.turtle.refuel(100)
      self.turtle.down()
    end
  end
end
end

function Mover:forward(count)
  local count = count or 1
  for i = 1, count do
    if not self.turtle.forward() then
      self.turtle.dig()
      if not self.turtle.forward() then
        self.io.read()
        self.turtle.refuel(100)
      self.turtle.forward()
    end
  end
end
end

function Mover:back(count)
  local count = count or 1
  for i = 1, count do
    if not self.turtle.back() then
      self:clockwise(2)
      self.turtle.dig()
      self:clockwise(2)
      if not self.turtle.back() then
        self.io.read()
        self.turtle.refuel(100)
      self.turtle.back()
    end
  end
end
end

function Mover:clockwise(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.turnRight()
  end
end

function Mover:widdershins(count)
  local count = count or 1
  for i = 1, count do
    self.turtle.turnLeft()
  end
end

if select(1, ...) ~= "mover" then
  require "bootstrapper"
  local mover = getMover()
  local command = select(1, ...)
  local count = select(2, ...) or 1
  mover[command](mover, count)
end

return Mover
