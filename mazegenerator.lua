local MazeGenerator = {}
local Empty = 0
local Unvisited = 1

-- Tree Growing Algorithm: see issue #1
function MazeGenerator:new()
  newObj = {}
  self.__index = self
  return setmetatable(newObj, self)
end

-- Recurive Backtracking Algorithm: Pop last
-- Prim's Algorithm: Pop random
local function popActiveCell(activeCells)
  local nextCell = table.remove(activeCells)
  return nextCell
end

local function isNotVisited(maze, row, column)
  return maze and maze[row] and maze[row][column] and maze[row][column] == Unvisited
end

local function shuffle(list)
  local shuffledList = {}
  for i = 1, #list do shuffledList[i] = list[i] end
  for i = #list, 2, -1 do
      local j = math.random(i)
      shuffledList[i], shuffledList[j] = shuffledList[j], shuffledList[i]
  end
  return shuffledList
end

local function getUnvisitedNeighbor(maze, currentCell)
  local north = {0, 2}
  local south = {0, -2}
  local west = {2, 0}
  local east = {-2, 0}
  local directions = shuffle({north, south, east, west})
  for i = 1, #directions do
    local direction = directions[i]
    local neighborX = currentCell[1] + direction[1]
    local neighborY = currentCell[2] + direction[2]
    if isNotVisited(maze, neighborX, neighborY) then
      return {neighborX, neighborY}
    end
  end
  return nil
end

local function createEmptyMaze(width, height)
  local emptyMaze = {}
  for row = 1, width do
    emptyMaze[row] = {}
    for column = 1, height do
      emptyMaze[row][column] = Unvisited
    end
  end
  return emptyMaze
end

local function getStartingCell(width, height)
  return {math.random(1, width/2) * 2, math.random(1,height/2) * 2}
end

local function markEmpty(maze, cell)
  local row = cell[1]
  local column = cell[2]
  maze[row][column] = Empty
end

local function connectAdjacentCells(maze, cellA, cellB)
  local x = (cellA[1] + cellB[1]) / 2
  local y = (cellA[2] + cellB[2]) / 2
  local connectionPoint = {x,y}
  markEmpty(maze, connectionPoint)
end

local function isEmpty(list)
  return next(list) == nil
end

local function buildTheMaze(maze, activeCells)
  if isEmpty(activeCells) then
    return maze
  end
  local activeCell = popActiveCell(activeCells)
  local unvisitedNeighbor = getUnvisitedNeighbor(maze, activeCell)
  if not unvisitedNeighbor then
    for i=1, #activeCells do
      if activeCell == activeCells[i] then
        table.remove(activeCells, i)
      end
    end
  else
    connectAdjacentCells(maze, activeCell, unvisitedNeighbor)
    table.insert(activeCells, activeCell)
    table.insert(activeCells, unvisitedNeighbor)
  end
  markEmpty(maze, activeCell)
  return buildTheMaze(maze, activeCells)
end

local function initializeActiveCells(startingCell)
  return {startingCell}
end

function MazeGenerator:generate(width, height)
  local emptyMaze = createEmptyMaze(width, height)
  local startingCell = getStartingCell(width, height)
  markEmpty(emptyMaze, startingCell)
  local activeCells = initializeActiveCells(startingCell)
  return buildTheMaze(emptyMaze, activeCells)
end

if select(1, ...) ~= "mazegenerator" then
  require "bootstrapper"
  local MazeGenerator = getMazeGenerator()
  local x = select(1, ...) or 16
  local y = select(2, ...) or 16
  local maze = MazeGenerator:generate(x, y)
  for row = 1, #maze do
    io.write(string.gsub(table.concat(maze[row]), Empty, " "), "\n")
  end
end

return MazeGenerator
