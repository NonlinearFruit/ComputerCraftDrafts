local Test = {}
local mover = require "mover_fake"
local placer = require "placer_fake"
local Tunnel = require "tunnel"
local tunnel
local oneIterationOfBlocks = 4
local oneIterationOfForwards = 5

local function setup()
  mover:reset()
  placer:reset()
  tunnel = Tunnel:new(mover, placer)
end

function Test.tunnel_places_one_iteration_of_blocks_by_default()
  setup()

  tunnel:tunnel()

  return placer.countOfPlaceDownCalls == oneIterationOfBlocks
end

function Test.tunnel_places_multiple_iterations_of_blocks()
  setup()
  local iterations = 7

  tunnel:tunnel(iterations)

  return placer.countOfPlaceDownCalls == iterations * oneIterationOfBlocks
end

function Test.tunnel_goes_forward()
  setup()

  tunnel:tunnel()

  return mover.countOfForwardCalls == oneIterationOfForwards
end

function Test.tunnel_goes_up_and_comes_back_down()
  setup()

  tunnel:tunnel()

  return mover.countOfUpCalls == mover.countOfDownCalls
end

function Test.tunnel_turns_right_and_turns_left()
  setup()

  tunnel:tunnel()

  return mover.countOfClockwiseCalls == mover.countOfWiddershinsCalls
end

return Test
