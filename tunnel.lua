local Tunnel = {}

function Tunnel:new(m, p)
  newObj = {}
  self.__index = self
  self.mover = m
  self.placer = p
  return setmetatable(newObj, self)
end

function Tunnel:tunnel(distance)
  local distance = distance or 1
  for i=1, distance do
    self.placer:placeDown()

    self.mover:up()
    self.mover:widdershins()
    self.mover:forward()
    self.placer:placeDown()

    self.mover:widdershins(2)
    self.mover:up(2)
    self.mover:forward()
    self.placer:placeDown()

    self.mover:forward()
    self.mover:down(2)
    self.placer:placeDown()

    self.mover:widdershins(2)
    self.mover:forward()
    self.mover:down()
    self.mover:clockwise()
    self.mover:forward()
  end
end

if select(1, ...) ~= "tunnel" then
  require "bootstrapper"
  local tunnel = getTunnel()
  local distance = select(1, ...) or 5
  tunnel:tunnel(distance)
end

return Tunnel