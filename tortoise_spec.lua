local M = {}
local turtle = require "turtle_fake"
local toad = require "tortoise"

local function setup()
  toad.init(turtle)
  turtle.reset()
end

function M.up_defaults_to_one_up()
  setup()

  toad.up()

  return turtle.countOfUpCalls == 1
end

function M.up_takes_a_count()
  setup()
  local count = 5
  
  toad.up(count)

  return turtle.countOfUpCalls == count
end

return M
