local Test = {}
local Automaton = require "automaton"

local function setup()
  automaton = Automaton:new()
end

local function countAliveCells(grid)
  local count = 0
  for row = 1, #grid do
    for column = 1, #grid[1] do
      if grid[row][column] == 1 then
        count = count + 1
      end
    end
  end
  return count
end

function Test.births_cell_with_zero_neighbors()
  setup()
  local birth = {0}
  local survival = {}
  local seed = {{0}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid)
end

function Test.survives_cell_with_zero_neighbors()
  setup()
  local birth = {}
  local survival = {0}
  local seed = {{1}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 1
end

function Test.toggles_cell_with_zero_neighbors()
  setup()
  local birth = {0}
  local survival = {}
  local seed = {{0}}

  local first = automaton:animate(birth, survival, seed)
  local second = automaton:animate(birth, survival, first)
  local third = automaton:animate(birth, survival, second)
  local fourth = automaton:animate(birth, survival, third)

  return countAliveCells(first) == 1 and countAliveCells(second) == 0 and countAliveCells(third) == 1 and countAliveCells(fourth) == 0
end

function Test.births_no_cell_with_zero_neighbors()
  setup()
  local birth = {}
  local survival = {}
  local seed = {{0}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 0
end

function Test.births_cell_with_one_neighbor()
  setup()
  local birth = {1}
  local survival = {}
  local seed = {{1, 0}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 1
end

function Test.births_no_cell_with_one_neighbor()
  setup()
  local birth = {}
  local survival = {}
  local seed = {{0, 1}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 0
end

function Test.birth_cell_with_one_neighbor()
  setup()
  local birth = {1}
  local survival = {}
  local seed = {{0, 1}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 1
end

function Test.calculates_output_for_every_input_cell()
  setup()
  local birth = {0}
  local survival = {}
  local seed = {{0,0,0},{0,0,0},{0,0,0}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 9
end

function Test.calculates_with_multiple_birth_rates()
  setup()
  local birth = {2, 4}
  local survival = {}
  local seed = {{0,1,0},{0,1,1},{1,0,1}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 2
end

function Test.calculates_with_multiple_survival_rates()
  setup()
  local birth = {}
  local survival = {1, 3}
  local seed = {{1,1,1},{0,1,0},{1,0,1}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 3
end

function Test.calculates_output_per_cell()
  setup()
  local birth = {1}
  local survival = {}
  local seed = {{0,0,0},{0,1,0},{0,0,0}}

  local grid = automaton:animate(birth, survival, seed)

  return countAliveCells(grid) == 8
end

function Test.count_handles_nil_grid()
  setup()

  local count = automaton:countNeighbors(1, 1, nil)

  return count == 0
end

function Test.count_handles_grid_with_nil_row()
  setup()

  local count = automaton:countNeighbors(1, 1, {})

  return count == 0
end

function Test.count_handles_grid_with_nil_column()
  setup()

  local count = automaton:countNeighbors(1, 1, {{}})

  return count == 0
end

function Test.count_returns_zero_when_no_neighbors()
  setup()

  local count = automaton:countNeighbors(1, 1, {{1}})

  return count == 0
end

function Test.counts_west_neighbor()
  setup()

  local count = automaton:countNeighbors(1, 2, {{1,1}})

  return count == 1
end

function Test.does_not_count_dead_west_neighbor()
  setup()

  local count = automaton:countNeighbors(1, 2, {{0,1}})

  return count == 0
end

function Test.counts_east_neighbor()
  setup()

  local count = automaton:countNeighbors(1, 1, {{1,1}})

  return count == 1
end

function Test.does_not_count_dead_east_neighbor()
  setup()

  local count = automaton:countNeighbors(1, 1, {{1,0}})

  return count == 0
end

function Test.counts_north_neighbor()
  setup()

  local count = automaton:countNeighbors(2, 1, {{1},{1}})

  return count == 1
end

function Test.does_not_count_dead_north_neighbor()
  setup()

  local count = automaton:countNeighbors(2, 1, {{0},{1}})

  return count == 0
end

function Test.counts_northwest_neighbor()
  setup()

  local count = automaton:countNeighbors(2, 2, {{1,0,0},{0,0,0},{0,0,0}})

  return count == 1
end

function Test.counts_northeast_neighbor()
  setup()

  local count = automaton:countNeighbors(2, 2, {{0,0,1},{0,0,0},{0,0,0}})

  return count == 1
end

function Test.counts_southwest_neighbor()
  setup()

  local count = automaton:countNeighbors(2, 2, {{0,0,0},{0,0,0},{0,0,1}})

  return count == 1
end

function Test.counts_southeast_neighbor()
  setup()

  local count = automaton:countNeighbors(2, 2, {{0,0,0},{0,0,0},{0,0,1}})

  return count == 1
end

function Test.does_not_count_dead_neighbors()
  setup()

  local count = automaton:countNeighbors(2, 2, {{0,0,0},{0,0,0},{0,0,0}})

  return count == 0
end

function Test.counts_south_neighbor()
  setup()

  local count = automaton:countNeighbors(1, 1, {{1},{1}})

  return count == 1
end

function Test.does_not_count_dead_south_neighbor()
  setup()

  local count = automaton:countNeighbors(1, 1, {{1},{0}})

  return count == 0
end

return Test
