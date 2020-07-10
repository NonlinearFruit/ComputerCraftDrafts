local Test = {}
local Placer = require "placer_fake"
local Tortoise = require "tortoise_fake"
local Builder = require "builder"

local function setup()
  placer = Placer:new()
  tortoise = Tortoise:new()
  builder = Builder:new(placer, tortoise)
end

function Test.print_moves_forward_for_each_cell_of_grid()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  return tortoise.countOfForwardCalls == #grid * #grid[1] * #grid[1][1]
end

function Test.print_moves_up_for_each_layer_of_the_grid()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  return tortoise.countOfUpCalls == #grid
end

function Test.print_turns_clockwise_proper_amount()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  local expected = #grid * #grid[1] - (#grid[1] % 2)
  return tortoise.countOfClockwiseCalls == expected
end

function Test.print_turns_widdershins_proper_amount()
  setup()
  local grid = {{{0,0,0}, {0,0,0}}, {{0,0,0}, {0,0,0}}}

  builder:print(grid)

  local expected = #grid * #grid[1] - (#grid[1] % 2)
  return tortoise.countOfWiddershinsCalls == expected
end

return Test
