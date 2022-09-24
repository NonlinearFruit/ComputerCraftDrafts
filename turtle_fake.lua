local Turtle = {}

function Turtle.up()
  Turtle.countOfUpCalls = Turtle.countOfUpCalls + 1
  if Turtle.returnsForUp then
    return Turtle.returnsForUp[Turtle.countOfUpCalls]
  end
  return Turtle.returnForUp
end

function Turtle.down()
  Turtle.countOfDownCalls = Turtle.countOfDownCalls + 1
  if Turtle.returnsForDown then
    return Turtle.returnsForDown[Turtle.countOfDownCalls]
  end
  return Turtle.returnForDown
end

function Turtle.forward()
  Turtle.countOfForwardCalls = Turtle.countOfForwardCalls + 1
  if Turtle.returnsForForward then
    return Turtle.returnsForForward[Turtle.countOfForwardCalls]
  end
  return Turtle.returnForForward
end

function Turtle.back()
  Turtle.countOfBackCalls = Turtle.countOfBackCalls + 1
  if Turtle.returnsForBack then
    return Turtle.returnsForBack[Turtle.countOfBackCalls]
  end
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

function Turtle.detectUp()
  Turtle.countOfDetectUpCalls = Turtle.countOfDetectUpCalls + 1
  if Turtle.returnsForDetectUp then
    return Turtle.returnsForDetectUp[Turtle.countOfDetectUpCalls]
  end
  return Turtle.returnForDetectUp
end

function Turtle.detectDown()
  Turtle.countOfDetectDownCalls = Turtle.countOfDetectDownCalls + 1
  if Turtle.returnsForDetectDown then
    return Turtle.returnsForDetectDown[Turtle.countOfDetectDownCalls]
  end
  return Turtle.returnForDetectDown
end

function Turtle.refuel(count)
  Turtle.countOfRefuelCalls = Turtle.countOfRefuelCalls + 1
  Turtle.lastCountPassedToRefuel = count
  return Turtle.returnForRefuel
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
  Turtle.countOfDetectUpCalls = 0
  Turtle.countOfDetectDownCalls = 0
  Turtle.countOfRefuelCalls = 0
  Turtle.returnsForUp = nil
  Turtle.returnsForDown = nil
  Turtle.returnsForForward = nil
  Turtle.returnsForBack = nil
  Turtle.returnsForGetItemCount = nil
  Turtle.returnsForDetectUp = nil
  Turtle.returnsForDetectDown = nil
end

Turtle.reset()
return Turtle
