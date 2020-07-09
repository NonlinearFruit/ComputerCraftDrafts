local Turtle = {}

function Turtle.up()
  Turtle.countOfUpCalls = Turtle.countOfUpCalls + 1
end

function Turtle.down()
  Turtle.countOfDownCalls = Turtle.countOfDownCalls + 1
end

function Turtle.forward()
  Turtle.countOfForwardCalls = Turtle.countOfForwardCalls + 1
end

function Turtle.back()
  Turtle.countOfBackCalls = Turtle.countOfBackCalls + 1
end

function Turtle.turnRight()
  Turtle.countOfTurnRightCalls = Turtle.countOfTurnRightCalls + 1
end

function Turtle.turnLeft()
  Turtle.countOfTurnLeftCalls = Turtle.countOfTurnLeftCalls + 1
end

function Turtle.reset()
  Turtle.countOfUpCalls = 0
  Turtle.countOfDownCalls = 0
  Turtle.countOfForwardCalls = 0
  Turtle.countOfBackCalls = 0
  Turtle.countOfTurnRightCalls = 0
  Turtle.countOfTurnLeftCalls = 0
end

Turtle.reset()
return Turtle
