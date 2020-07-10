local Placer = {}

function Placer:new()
  newObj = {}
  self.__index = self
  self.countOfPlaceDownCalls = 0
  return setmetatable(newObj, self)
end

function Placer:placeDown()
  self.countOfPlaceDownCalls = self.countOfPlaceDownCalls + 1
end

return Placer
