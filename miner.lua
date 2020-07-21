local Miner = {}

function Miner:new(m)
  newObj = {}
  self.__index = self
  self.mover = m
  return setmetatable(newObj, self)
end

function Miner:tunnel(distance)
  self.mover:forward(distance)
  self.mover:clockwise()
  self.mover:down()
  self.mover:clockwise()
  self.mover:forward(distance)
end

if select(1, ...) ~= "miner" then
  require "bootstrapper"
  local miner = getMiner()
  local distance = select(1, ...) or 100
  miner:tunnel(distance)
end

return Miner
