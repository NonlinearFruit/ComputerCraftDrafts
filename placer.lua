local Placer = {}

function Placer:new(i, t)
  newObj = {}
  self.__index = self
  self.turtle = t
  self.io = i
  return setmetatable(newObj, self)
end

function Placer:placeDown()
  local block = 1
  while(self.turtle.getItemCount(block) == 0) do 
    if block == 16 then
      self.io.read()
      block = 0
    end
    block = block + 1
  end
  self.turtle.select(block)
  if not self.turtle.placeDown() then
    self.turtle.digDown()
    self.turtle.placeDown()
  end
end

return Placer
