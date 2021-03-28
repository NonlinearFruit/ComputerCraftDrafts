local Automaton = {}
local Alive = 1
local Dead = 0

function Automaton:new()
  newObj = {}
  self.__index = self
  return setmetatable(newObj, self)
end

local function isAlive(row, column, grid)
  return grid and grid[row] and grid[row][column] and grid[row][column] == Alive
end

function Automaton:countNeighbors(row, column, grid)
  local count = 0
  if isAlive(row, column-1, grid) then -- West
    count = count + 1
  end
  if isAlive(row-1, column-1, grid) then -- North West
    count = count + 1
  end
  if isAlive(row-1, column, grid) then -- North
    count = count + 1
  end
  if isAlive(row-1, column+1, grid) then -- North East
    count = count + 1
  end
  if isAlive(row, column+1, grid) then -- East
    count = count + 1
  end
  if isAlive(row+1, column+1, grid) then -- South East
    count = count + 1
  end
  if isAlive(row+1, column, grid) then -- South
    count = count + 1
  end
  if isAlive(row+1, column-1, grid) then -- South West
    count = count + 1
  end
  return count
end

local function contains(item, list)
  if not list and item then
    return false
  end
  for i = 1, #list do
    if list[i] == item then
      return true
    end
  end
  return false
end

function Automaton:animate(birth, survival, seed)
  local nextGen = {}
  for row = 1, #seed do
    nextGen[row] = {}
    for column = 1, #seed[1] do
      local oldValue = seed[row][column]
      local newValue = oldValue
      local neighbors = self:countNeighbors(row,column,seed)
      if oldValue == Alive and not contains(neighbors, survival) then
        newValue = Dead
      elseif oldValue == Dead and contains(neighbors, birth) then
        newValue = Alive
      end
      nextGen[row][column] = newValue
    end
  end
  return nextGen
end

return Automaton
