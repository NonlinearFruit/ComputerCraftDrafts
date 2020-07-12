local layer = 5
local row = 4
local column = 3
local layer_parity = 0

local function process_columns(start, stop, increment)
  for c = start, stop, increment do
    turtle.forward()
    turtle.placeDown()
  end
end

local function process_rows(start, stop, increment, l)
  for r = start, stop, increment do
    if (r%2 == 1 and l%2 == 0) or (r%2 == 1 and l%2 == 1) then
      process_columns(1, column, 1)
      turtle.forward()
      turtle.turnLeft()
      if r ~= stop then
        turtle.forward()
      end
      turtle.turnLeft()
    else
      process_columns(column, 1, -1)
      turtle.forward()
      turtle.turnRight()
      if r ~= stop then
        turtle.forward()
      end
      turtle.turnRight()
    end
  end
end

local function process_layers()
  for l = 1, layer do
    if l%2 == 0 then
      process_rows(1, row, 1, l)
    else
      process_rows(row, 1, -1, l)
    end
    turtle.up()    
  end
end

process_layers()
return result
