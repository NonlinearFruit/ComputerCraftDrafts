local Tortoise = {}

function Tortoise:new()
  newObj = {}
  self.__index = self
  self.countOfForwardCalls = 0
  self.countOfClockwiseCalls = 0
  self.countOfUpCalls = 0
  self.countOfWiddershinsCalls = 0
  return setmetatable(newObj, self)
end

function Tortoise:forward()
  self.countOfForwardCalls = self.countOfForwardCalls + 1
end

function Tortoise:clockwise()
  self.countOfClockwiseCalls = self.countOfClockwiseCalls + 1
end

function Tortoise:up()
  self.countOfUpCalls = self.countOfUpCalls + 1
end

function Tortoise:widdershins()
  self.countOfWiddershinsCalls = self.countOfWiddershinsCalls + 1
end

return Tortoise
