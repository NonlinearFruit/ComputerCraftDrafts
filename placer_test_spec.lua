Test = {}

function Test.output_is_the_same()
  result = require "placer_test"

  return result == ":1,1,1:1,1,2:1,2,2:1,2,1:1,3,1:1,3,2:2,3,2:2,3,1:2,2,1:2,2,2:2,1,2:2,1,1:3,1,1:3,1,2:3,2,2:3,2,1:3,3,1:3,3,2:4,3,2:4,3,1:4,2,1:4,2,2:4,1,2:4,1,1"
end

return Test
