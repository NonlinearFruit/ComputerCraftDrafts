local Builder = {}

function Builder:new(p, t)
  newObj = {}
  self.__index = self
  self.placer = p
  self.tortoise = t
  return setmetatable(newObj, self)
end

local layer = 5
local row = 4
local column = 3
local layer_parity = 0

function Builder:process_columns(start, stop, increment, l, r)
  for c = start, stop, increment do
    self.tortoise:forward()
    if self.grid[l][r][c] == 1 then
      self.placer:placeDown()
    else
      self.placer:digDown()
    end
  end
end

function Builder:process_rows(start, stop, increment, l)
  for r = start, stop, increment do
    if (r%2 == 1 and l%2 == 0) or (r%2 == 1 and l%2 == 1) then
      self:process_columns(1, column, 1, l, r)
      self.tortoise:forward()
      self.tortoise:widdershins()
      if r ~= stop then
        self.tortoise:forward()
      end
      self.tortoise:widdershins()
    else
      self:process_columns(column, 1, -1, l, r)
      self.tortoise:forward()
      self.tortoise:clockwise()
      if r ~= stop then
        self.tortoise:forward()
      end
      self.tortoise:clockwise()
    end
  end
end

function Builder:process_layers()
  for l = 1, layer do
    if l%2 == 0 then
      self:process_rows(1, row, 1, l)
    else
      self:process_rows(row, 1, -1, l)
    end
    self.tortoise:up()    
  end
end

function Builder:print(grid)
  layer = #grid
  row = #grid[1]
  column = #grid[1][1]
  self.grid = grid
  self:process_layers()
end

return Builder
