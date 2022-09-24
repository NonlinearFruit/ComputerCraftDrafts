local Test = {}
local turtle = require "turtle_fake"
local io = require "io_fake"
local Mover = require "mover"
local mover

local function setup()
  mover = Mover:new(turtle, io)
  io.reset()
  turtle.reset()
  turtle.returnForUp = true
  turtle.returnForDown = true
  turtle.returnForForward = true
  turtle.returnForBack = true
end

function Test.up_defaults_to_one_up()
  setup()

  mover:up()

  return turtle.countOfUpCalls == 1
end

function Test.up_takes_a_count()
  setup()
  local count = 5
  
  mover:up(count)

  return turtle.countOfUpCalls == count
end

function Test.up_digs_and_tries_again()
  setup()
  turtle.returnsForUp = {false, true}

  mover:up()

  local dug = turtle.countOfDigUpCalls == 1
  local triedAgain = turtle.countOfUpCalls == 2
  return dug and triedAgain
end

function Test.up_refuels_after_digging_and_tries_a_third_time()
  setup()
  turtle.returnForUp = false

  mover:up()

  local waits = io.countOfReadCalls == 1
  local refuels = turtle.countOfRefuelCalls == 1 and turtle.lastCountPassedToRefuel == 100
  local triedAgain = turtle.countOfUpCalls == 3
  return waits and refuels and triedAgain
end

function Test.down_defaults_to_one_down()
  setup()

  mover:down()

  return turtle.countOfDownCalls == 1
end

function Test.down_takes_a_count()
  setup()
  local count = 5

  mover:down(count)

  return turtle.countOfDownCalls == count
end

function Test.down_digs_and_tries_again()
  setup()
  turtle.returnsForDown = {false, true}

  mover:down()

  local dug = turtle.countOfDigDownCalls == 1
  local triedAgain = turtle.countOfDownCalls == 2
  return dug and triedAgain
end

function Test.down_refuels_after_digging_and_tries_a_third_time()
  setup()
  turtle.returnForDown = false

  mover:down()

  local waits = io.countOfReadCalls == 1
  local refuels = turtle.countOfRefuelCalls == 1 and turtle.lastCountPassedToRefuel == 100
  local triedAgain = turtle.countOfDownCalls == 3
  return waits and refuels and triedAgain
end

function Test.forward_defaults_to_one_forward()
  setup()

  mover:forward()

  return turtle.countOfForwardCalls == 1
end

function Test.forward_takes_a_count()
  setup()
  local count = 5

  mover:forward(count)

  return turtle.countOfForwardCalls == count
end

function Test.forward_digs_and_tries_again()
  setup()
  turtle.returnsForForward = {false, true}

  mover:forward()

  local dug = turtle.countOfDigCalls == 1
  local triedAgain = turtle.countOfForwardCalls == 2
  return dug and triedAgain
end

function Test.forward_refuels_after_digging_and_tries_a_third_time()
  setup()
  turtle.returnForForward = false

  mover:forward()

  local waits = io.countOfReadCalls == 1
  local refuels = turtle.countOfRefuelCalls == 1 and turtle.lastCountPassedToRefuel == 100
  local triedAgain = turtle.countOfForwardCalls == 3
  return waits and refuels and triedAgain
end

function Test.back_defaults_to_one_back()
  setup()

  mover:back()

  return turtle.countOfBackCalls == 1
end

function Test.back_takes_a_count()
  setup()
  local count = 5

  mover:back(count)

  return turtle.countOfBackCalls == count
end

function Test.back_turns_around_digs_tries_again()
  setup()
  turtle.returnsForBack = {false, true}

  mover:back()

  local turnsAround = turtle.countOfTurnRightCalls == 4  
  local dug = turtle.countOfDigCalls == 1
  local triedAgain = turtle.countOfBackCalls == 2
  return turnsAround and dug and triedAgain
end

function Test.back_refuels_after_digging_and_tries_a_third_time()
  setup()
  turtle.returnForBack = false

  mover:back()

  local waits = io.countOfReadCalls == 1
  local refuels = turtle.countOfRefuelCalls == 1 and turtle.lastCountPassedToRefuel == 100
  local triedAgain = turtle.countOfBackCalls == 3
  return waits and refuels and triedAgain
end

function Test.clockwise_turns_right_once()
  setup()

  mover:clockwise()

  return turtle.countOfTurnRightCalls == 1
end

function Test.clockwise_takes_a_count()
  setup()
  local count = 5

  mover:clockwise(count)

  return turtle.countOfTurnRightCalls == count
end

function Test.widdershins_turns_left_once()
  setup()
  
  mover:widdershins()

  return turtle.countOfTurnLeftCalls == 1
end

function Test.widdershins_takes_a_count()
  setup()
  local count = 5

  mover:widdershins(count)

  return turtle.countOfTurnLeftCalls == count
end

return Test
