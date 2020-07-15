local Test = {}
local Miner = require "miner"
local Mover = require "tortoise_fake"
local miner
local mover

local function setup()
  mover = Mover:new()
  miner = Miner:new(mover)
end

return Test
