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
    if layer % 2 == 1 then
      for row = 1, #grid[1] do
        if row % 2 == 1 then
          for column = 1, #grid[1][1] do
            self.tortoise:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        else
          for column = #grid[1][1], 1, -1 do
            self.tortoise:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        end
        if row % 2 == 1 then
          self.tortoise:forward()
          self.tortoise:clockwise()
          if row ~= #grid[1] then
            self.tortoise:forward()
          end
          self.tortoise:clockwise()
        else
          self.tortoise:forward()
          self.tortoise:widdershins()
          if row ~= #grid[1] then
            self.tortoise:forward()
          end
          self.tortoise:widdershins()
        end
      end
      self.tortoise:up()
    else
      for row = #grid[1],1,-1 do
        if row % 2 == 1 then
          for column = 1, #grid[1][1] do
            self.tortoise:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        else
          for column = #grid[1][1], 1, -1 do
            self.tortoise:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        end
        if row % 2 == 1 then
          self.tortoise:forward()
          self.tortoise:clockwise()
          if row ~= #grid[1] then
            self.tortoise:forward()
          end
          self.tortoise:clockwise()
        else
          self.tortoise:forward()
          self.tortoise:widdershins()
          if row ~= #grid[1] then
            self.tortoise:forward()
          end
          self.tortoise:widdershins()
        end
      end
      self.tortoise:up()
    end
  end
end

return Builder
