local tortoise = {}
local turtle

function tortoise.init(t)
  turtle = t
end

function tortoise.up(count)
  local count = count or 1
  for i = 1, count do
    turtle.up()
  end
end

return tortoise
