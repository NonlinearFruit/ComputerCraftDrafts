local Turtle = {}

function Turtle.up()
  Turtle.countOfUpCalls = Turtle.countOfUpCalls+1
end

function Turtle.reset()
  Turtle.countOfUpCalls = 0
end

Turtle.reset()
return Turtle
