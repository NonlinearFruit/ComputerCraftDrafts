local layer = 4
local row = 3
local column = 2
local layer_parity = 0
local row_parity = 0
local result = ""

local function process_columns(start, stop, increment, l, r)
  for c = start, stop, increment do
    print(l..","..r..","..c)
    result = result..":"..l..","..r..","..c
  end
end

local function process_rows(start, stop, increment, l)
  for r = start, stop, increment do
    if row_parity == 0 then
      process_columns(1, column, 1, l, r)
    else
      process_columns(column, 1, -1, l, r)
    end
    row_parity = (row_parity + 1) % 2
  end
end

local function process_layers()
  for l = 1, layer do
    if layer_parity == 0 then
      process_rows(1, row, 1, l)
    else
      process_rows(row, 1, -1, l)
    end
    layer_parity = (layer_parity + 1) % 2
  end
end

process_layers()
return result
