local Test = {}
local turtle = require "turtle_fake"
local io = require "io_fake"
local Placer = require "placer"
local placer

local function setup()
  placer = Placer:new(io, turtle)
  io.reset()
  turtle.reset()
  turtle.returnForPlaceDown = true
end

function Test.placeDown_calls_placeDown()
  setup()

  placer:placeDown()

  return turtle.countOfPlaceDownCalls == 1
end

function Test.placeDown_digs_and_tries_again()
  setup()
  turtle.returnForPlaceDown = false

  placer:placeDown()

  local dug = turtle.countOfDigDownCalls == 1
  local triedAgain = turtle.countOfPlaceDownCalls == 2
  return dug and triedAgain
end

function Test.placeDown_counts_first_block()
  setup()

  placer:placeDown()

  local count = turtle.countOfGetItemCountCalls == 1
  local firstBlock = turtle.lastBlockPassedToGetItemCount == 1
  return count and firstBlock
end

function Test.placeDown_if_has_count_selects_block()
  setup()
  turtle.returnForGetItemCount = 64

  placer:placeDown()

  local selects = turtle.countOfSelectCalls == 1
  local lastBlock = turtle.lastBlockPassedToSelect == 1
  return selects and lastBlock
end

function Test.placeDown_calls_count_until_blocks_are_found()
  setup()
  turtle.returnsForGetItemCount = {0, 0, 0, 64}
  local slotNumber = 4

  placer:placeDown()

  local counts = turtle.countOfGetItemCountCalls == slotNumber
  local lastSlotCounted = turtle.lastBlockPassedToGetItemCount == slotNumber
  local selects = turtle.countOfSelectCalls == 1
  local slotSelected = turtle.lastBlockPassedToSelect == slotNumber
  return counts and lastSlotCounted and selects and slotSelected
end

function Test.placeDown_asks_for_a_refill_if_no_blocks_found()
  setup()
  turtle.returnsForGetItemCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64}

  placer:placeDown()

  local counts = turtle.countOfGetItemCountCalls == 17
  local asks = io.countOfReadCalls == 1
  return counts and asks
end

function Test.placeDown_resets_block_count_after_refill()
  setup()
  turtle.returnsForGetItemCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64}

  placer:placeDown()

  return turtle.lastBlockPassedToGetItemCount == 1
end

return Test
