local Mover = {}

function Mover:new()
  newObj = {}
  self.__index = self
  self.countOfForwardCalls = 0
  self.countOfClockwiseCalls = 0
  self.countOfUpCalls = 0
  self.countOfDownCalls = 0
  self.countOfWiddershinsCalls = 0
  return setmetatable(newObj, self)
end

function Mover:forward(count)
  self.countOfForwardCalls = self.countOfForwardCalls + 1
  if not self.firstCountPassedToForward then
    self.firstCountPassedToForward = count
  end
  self.lastCountPassedToForward = count
end

function Mover:clockwise()
  self.countOfClockwiseCalls = self.countOfClockwiseCalls + 1
end

function Mover:down()
  self.countOfDownCalls = self.countOfDownCalls + 1
end

function Mover:up()
  self.countOfUpCalls = self.countOfUpCalls + 1
end

function Mover:widdershins()
  self.countOfWiddershinsCalls = self.countOfWiddershinsCalls + 1
end

return Mover
