local Mover = require "mover"
local Placer = require "placer"
local Builder = require "builder"
local Miner = require "miner"
local Lumberjack = require "lumberjack"

function getMover()
  return Mover:new(turtle)
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
