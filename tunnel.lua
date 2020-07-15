local Miner = {}

function Miner:new(m)
  newObj = {}
  self.__index = self
  self.mover = m
  return setmetatable(newObj, self)
end

function Miner:tunnel(distance)
end
t = require("tortoise"):new(turtle)

function dig(count)
  while(count > 0) do
    count = count - 1;
    turtle.dig();
    t:forward();
  end
end

function retreat(count)
  t:clockwise(2);
  t:forward(count);
end

local count = 100;
dig(count);
retreat(count);
return Miner
