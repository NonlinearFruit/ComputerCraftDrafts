local Builder = {}

function Builder:new(p, t)
  newObj = {}
  self.__index = self
  self.placer = p
  self.tortoise = t
  return setmetatable(newObj, self)
end

-- starts right above bottom layer, top left of the grid
function Builder:print(grid)
  for layer = 1, #grid do
    for row = 1, #grid[1] do
      for column = 2, #grid[1][1] do
        self.tortoise:forward()
      end
      if row % 2 == 1 then
        self.tortoise:clockwise()
        self.tortoise:forward()
        self.tortoise:clockwise()
      else
        self.tortoise:widdershins()
        self.tortoise:forward()
        self.tortoise:widdershins()
      end
    end
    self.tortoise:up()
  end
end

return Builder
