local Test = {}
local Lumberjack = require "lumberjack"
local turtle = require "turtle_fake"
local lumberjack

local function setup()
  turtle.reset()
  turtle.returnsForDetectDown = {true}
  lumberjack = Lumberjack:new(turtle)
end

function Test.fell_goes_up()
  setup()
  turtle.returnsForDetectUp = {true, false}

  lumberjack:fell()

  return turtle.countOfUpCalls == 1
end

function Test.fell_goes_way_up()
  setup()
  turtle.returnsForDetectUp = {true, true, true, true, true, false}

  lumberjack:fell()

  return turtle.countOfUpCalls == #turtle.returnsForDetectUp - 1
end

function Test.fell_digs_up()
  setup()
  turtle.returnsForDetectUp = {true, false}

  lumberjack:fell()

  return turtle.countOfDigUpCalls == 1
end

function Test.fell_digs_way_up()
  setup()
  turtle.returnsForDetectUp = {true, true, true, true, true, false}

  lumberjack:fell()

  return turtle.countOfDigUpCalls == #turtle.returnsForDetectUp - 1
end

function Test.fell_goes_down()
  setup()
  turtle.returnsForDetectDown = {false, true}

  lumberjack:fell()

  return turtle.countOfDownCalls == 1
end

function Test.fell_goes_way_down()
  setup()
  turtle.returnsForDetectDown = {false, false, false, true}

  lumberjack:fell()

  return turtle.countOfDownCalls == #turtle.returnsForDetectDown - 1
end

return Test
