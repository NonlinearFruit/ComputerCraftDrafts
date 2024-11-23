if select(1, ...) ~= "printmaze" then
  require("bootstrapper")
  local MazeGenerator = getMazeGenerator()
  local Builder = getBuilder()
  local x = select(1, ...) or 16
  local y = select(2, ...) or 16
  local z = select(3, ...) or 3
  local maze = MazeGenerator:generate(x, y)
  local grid = {}
  for _ = 1, z do
    table.insert(grid, maze)
  end
  Builder:print(grid)
end
