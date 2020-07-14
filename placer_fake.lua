local Placer = {}

function Placer:new()
  newObj = {}
  self.__index = self
  self.countOfPlaceDownCalls = 0
  self.countOfDigDownCalls = 0
  self.sequenceOfPlaceAndDig = ""
  return setmetatable(newObj, self)
end

function Placer:placeDown()
  self.countOfPlaceDownCalls = self.countOfPlaceDownCalls + 1
  self.sequenceOfPlaceAndDig = self.sequenceOfPlaceAndDig .. "1"
end

function Placer:digDown()
  self.countOfDigDownCalls = self.countOfDigDownCalls + 1
  self.sequenceOfPlaceAndDig = self.sequenceOfPlaceAndDig .. "0"
end

return Placer
