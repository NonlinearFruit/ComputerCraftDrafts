local Builder = {}

function Builder:new(p, m)
  newObj = {}
  self.__index = self
  self.placer = p
  self.mover = m
  return setmetatable(newObj, self)
end

function Builder:print(grid)
  for layer = 1, #grid do
    if layer % 2 == 1 then
      for row = 1, #grid[1] do
        if row % 2 == 1 then
          for column = 1, #grid[1][1] do
            self.mover:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        else
          for column = #grid[1][1], 1, -1 do
            self.mover:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        end
        if row % 2 == 1 then
          self.mover:forward()
          self.mover:clockwise()
          if row ~= #grid[1] then
            self.mover:forward()
          end
          self.mover:clockwise()
        else
          self.mover:forward()
          self.mover:widdershins()
          if row ~= #grid[1] then
            self.mover:forward()
          end
          self.mover:widdershins()
        end
      end
      self.mover:up()
    else
      for row = #grid[1],1,-1 do
        if row % 2 == 0 then
          for column = 1, #grid[1][1] do
            self.mover:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        else
          for column = #grid[1][1], 1, -1 do
            self.mover:forward()
            if grid[layer][row][column] == 1 then
              self.placer:placeDown()
            else
              self.placer:digDown()
            end
          end
        end
        if row % 2 == 1 then
          self.mover:forward()
          self.mover:clockwise()
          if row ~= 1 then
            self.mover:forward()
          end
          self.mover:clockwise()
        else
          self.mover:forward()
          self.mover:widdershins()
          if row ~= 1 then
            self.mover:forward()
          end
          self.mover:widdershins()
        end
      end
      self.mover:up()
    end
  end
end

if select(1, ...) ~= "builder" then
  require "bootstrapper"
  local builder = getBuilder()
  local grid = {{
      {1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,1,1,0,1,1,1,1,1,0,1},
      {1,0,1,0,0,0,1,0,1,0,0,0,1},
      {1,0,1,1,1,1,1,0,1,0,1,1,1},
      {0,0,0,0,1,0,0,0,1,0,0,0,0},
      {1,0,1,0,1,1,1,0,1,1,1,1,1},
      {1,0,1,0,0,0,0,0,1,0,0,0,1},
      {1,0,1,1,1,1,1,1,1,0,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,1,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1}
  },{
      {1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,1,1,0,1,1,1,1,1,0,1},
      {1,0,1,0,0,0,1,0,1,0,0,0,1},
      {1,0,1,1,1,1,1,0,1,0,1,1,1},
      {0,0,0,0,1,0,0,0,1,0,0,0,0},
      {1,0,1,0,1,1,1,0,1,1,1,1,1},
      {1,0,1,0,0,0,0,0,1,0,0,0,1},
      {1,0,1,1,1,1,1,1,1,0,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,1,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1}
  },{
      {1,1,1,1,1,1,1,1,1,1,1,1,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,1,1,1,0,1,1,1,1,1,0,1},
      {1,0,1,0,0,0,1,0,1,0,0,0,1},
      {1,0,1,1,1,1,1,0,1,0,1,1,1},
      {0,0,0,0,1,0,0,0,1,0,0,0,0},
      {1,0,1,0,1,1,1,0,1,1,1,1,1},
      {1,0,1,0,0,0,0,0,1,0,0,0,1},
      {1,0,1,1,1,1,1,1,1,0,1,0,1},
      {1,0,0,0,0,0,0,0,0,0,1,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1}
  }}
  builder:print(grid)
end

return Builder
