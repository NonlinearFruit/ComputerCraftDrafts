local Turtle = {}

function Turtle.up()
  Turtle.countOfUpCalls = Turtle.countOfUpCalls + 1
  return Turtle.returnForUp
end

function Turtle.down()
  Turtle.countOfDownCalls = Turtle.countOfDownCalls + 1
  return Turtle.returnForDown
end

function Turtle.forward()
  Turtle.countOfForwardCalls = Turtle.countOfForwardCalls + 1
  return Turtle.returnForForward
end

function Turtle.back()
  Turtle.countOfBackCalls = Turtle.countOfBackCalls + 1
  return Turtle.returnForBack
end

function Turtle.turnRight()
  Turtle.countOfTurnRightCalls = Turtle.countOfTurnRightCalls + 1
end

function Turtle.turnLeft()
  Turtle.countOfTurnLeftCalls = Turtle.countOfTurnLeftCalls + 1
end

function Turtle.digUp()
  Turtle.countOfDigUpCalls = Turtle.countOfDigUpCalls + 1
end

function Turtle.digDown()
  Turtle.countOfDigDownCalls = Turtle.countOfDigDownCalls + 1
end

function Turtle.dig()
  Turtle.countOfDigCalls = Turtle.countOfDigCalls + 1
end

function Turtle.placeDown()
  Turtle.countOfPlaceDownCalls = Turtle.countOfPlaceDownCalls + 1
  return Turtle.returnForPlaceDown
end

function Turtle.select(block)
  Turtle.countOfSelectCalls = Turtle.countOfSelectCalls + 1
  Turtle.lastBlockPassedToSelect = block
end

function Turtle.getItemCount(block)
  Turtle.countOfGetItemCountCalls = Turtle.countOfGetItemCountCalls + 1
  Turtle.lastBlockPassedToGetItemCount = block
  if Turtle.returnsForGetItemCount then
    return Turtle.returnsForGetItemCount[Turtle.countOfGetItemCountCalls]
  end
  return Turtle.returnForGetItemCount
end

function Turtle.reset()
  Turtle.countOfUpCalls = 0
  Turtle.countOfDownCalls = 0
  Turtle.countOfForwardCalls = 0
  Turtle.countOfBackCalls = 0
  Turtle.countOfTurnRightCalls = 0
  Turtle.countOfTurnLeftCalls = 0
  Turtle.countOfDigUpCalls = 0
  Turtle.countOfDigDownCalls = 0
  Turtle.countOfDigCalls = 0
  Turtle.countOfPlaceDownCalls = 0
  Turtle.countOfSelectCalls = 0
  Turtle.countOfGetItemCountCalls = 0
  Turtle.returnsForGetItemCount = nil
end

Turtle.reset()
return Turtle
