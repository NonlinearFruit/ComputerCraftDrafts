local Test = {}
local turtle = require "turtle_fake"
local Tortoise = require "tortoise"
local tortoise

local function setup()
  tortoise = Tortoise:new(turtle)
  turtle.reset()
end

function Test.up_defaults_to_one_up()
  setup()

  tortoise:up()

  return turtle.countOfUpCalls == 1
end

function Test.up_takes_a_count()
  setup()
  local count = 5
  
  tortoise:up(count)

  return turtle.countOfUpCalls == count
end

return Test
