local Mover = require "mover"
local Placer = require "placer"
local Builder = require "builder"
local Miner = require "miner"
local Lumberjack = require "lumberjack"
local Automaton = require "automaton"
local MazeGenerator = require "mazegenerator"
local Tunnel = require "tunnel"

function getMover()
  return Mover:new(turtle, io)
end

function getPlacer()
  return Placer:new(io, turtle)
end

function getBuilder()
  return Builder:new(getPlacer(), getMover())
end

function getMiner()
  return Miner:new(getMover())
end

function getLumberjack()
  return Lumberjack:new(turtle)
end

function getAutomaton()
  return Automaton:new()
end


function getTunnel()
  return Tunnel:new(getMover(), getPlacer())
end

function getMazeGenerator()
  return MazeGenerator:new()
end