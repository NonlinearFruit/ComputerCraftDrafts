local Test = {}
local Placer = require "placer_fake"
local Mover = require "mover_fake"
local Builder = require "builder"

local function setup()
  placer = Placer:new()
  mover = Mover:new()
  builder = Builder:new(placer, mover)
end

function Test.print_moves_forward_for_each_cell_of_grid()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  local printingMovements = #grid * #grid[1] * #grid[1][1]
  local turningAroundMovements = #grid + (2*(#grid[1]-1) * #grid)
  return mover.countOfForwardCalls == printingMovements + turningAroundMovements
end

function Test.print_moves_up_for_each_layer_of_the_grid()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  return mover.countOfUpCalls == #grid
end

function Test.print_turns_clockwise_proper_amount()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  local expected = #grid * #grid[1] - (#grid[1] % 2)
  return mover.countOfClockwiseCalls == expected
end

function Test.print_turns_widdershins_proper_amount()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  local expected = #grid * #grid[1] - (#grid[1] % 2)
  return mover.countOfWiddershinsCalls == expected
end

function Test.print_places_the_proper_number_of_blocks()
  setup()
  local grid = {{{1,1,1}, {1,1,1}}, {{1,1,1}, {1,1,1}}}

  builder:print(grid)

  local allPlace = placer.countOfPlaceDownCalls == #grid * #grid[1] * #grid[1][1]
  local noDig = placer.countOfDigDownCalls == 0
  return allPlace and noDig
end

function Test.print_digs_the_proper_number_of_blocks()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  local allDig = placer.countOfDigDownCalls == #grid * #grid[1] * #grid[1][1]
  local noPlace = placer.countOfPlaceDownCalls == 0
  return allDig and noPlace
end

local function sequenceTest(grid, sequence)
  setup()

  builder:print(grid)

  return placer.sequenceOfPlaceAndDig == sequence
end

local sequenceTests = {
  {{{{0}}}, "0"}, -- One Column
  {{{{0, 1}}}, "01"}, -- Two Column / One Row
  {{{{0, 0}, {1, 0}}}, "0001"}, -- Two Row
  {{{{0, 0}, {0, 0}, {1,0}}}, "000010"}, -- Three Row
  {{{{0},{1}},{{0},{1}}}, "0110"}, -- Two Layer
  {{{{0},{1}},{{0},{1}}}, "0110"}, -- Two Layer
}

for index, test in pairs(sequenceTests) do
  Test["printing_grid_order_matches_sequence_"..index] = function () return sequenceTest(sequenceTests[index][1], sequenceTests[index][2]) end
end

return Test
