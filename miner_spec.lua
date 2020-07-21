local Test = {}
local Miner = require "miner"
local Mover = require "mover_fake"
local miner
local mover

local function setup()
  mover = Mover:new()
  miner = Miner:new(mover)
end

function Test.tunnel_moves_forward_there_and_back()
  setup()
  local count = 50

  miner:tunnel(count)

  local goesForward = mover.countOfForwardCalls == 2
  local there = mover.firstCountPassedToForward == count
  local back = mover.lastCountPassedToForward == count
  return goesForward and there and back
end

function Test.tunnel_goes_down_once()
  setup()

  miner:tunnel()

  return mover.countOfDownCalls == 1
end

function Test.tunnel_turns_around()
  setup()

  miner:tunnel()

  return mover.countOfClockwiseCalls == 2
end

return Test
