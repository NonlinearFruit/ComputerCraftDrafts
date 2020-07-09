local Test = {}
local turtle = require "turtle_fake"
local Tortoise = require "tortoise"
local tortoise

local function setup()
  tortoise = Tortoise:new(turtle)
  turtle.reset()
  turtle.returnForUp = true
  turtle.returnForDown = true
end

function Test.up_defaults_to_one_up()
  setup()

  tortoise:up()

  return turtle.countOfUpCalls == 1
end

function Test.up_takes_a_count()
  setup()
  local count = 5
  
  tortoise:up(count)

  return turtle.countOfUpCalls == count
end

function Test.up_digs_and_tries_again()
  setup()
  turtle.returnForUp = false

  tortoise:up()

  local dug = turtle.countOfDigUpCalls == 1
  local triedAgain = turtle.countOfUpCalls == 2
  return dug and triedAgain
end

function Test.down_defaults_to_one_down()
  setup()

  tortoise:down()

  return turtle.countOfDownCalls == 1
end

function Test.down_takes_a_count()
  setup()
  local count = 5

  tortoise:down(count)

  return turtle.countOfDownCalls == count
end

function Test.down_digs_and_tries_again()
  setup()
  turtle.returnForDown = false

  tortoise:down()

  local dug = turtle.countOfDigDownCalls == 1
  local triedAgain = turtle.countOfDownCalls == 2
  return dug and triedAgain
end

function Test.forward_defaults_to_one_forward()
  setup()

  tortoise:forward()

  return turtle.countOfForwardCalls == 1
end

function Test.forward_takes_a_count()
  setup()
  local count = 5

  tortoise:forward(count)

  return turtle.countOfForwardCalls == count
end

function Test.back_defaults_to_one_back()
  setup()

  tortoise:back()

  return turtle.countOfBackCalls == 1
end

function Test.back_takes_a_count()
  setup()
  local count = 5

  tortoise:back(count)

  return turtle.countOfBackCalls == count
end

function Test.clockwise_turns_right_once()
  setup()

  tortoise:clockwise()

  return turtle.countOfTurnRightCalls == 1
end

function Test.clockwise_takes_a_count()
  setup()
  local count = 5

  tortoise:clockwise(count)

  return turtle.countOfTurnRightCalls == count
end

function Test.widdershins_turns_left_once()
  setup()
  
  tortoise:widdershins()

  return turtle.countOfTurnLeftCalls == 1
end

function Test.widdershins_takes_a_count()
  setup()
  local count = 5

  tortoise:widdershins(count)

  return turtle.countOfTurnLeftCalls == count
end

return Test
