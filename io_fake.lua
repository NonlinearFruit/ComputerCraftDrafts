local Io = {}

function Io.read()
  Io.countOfReadCalls = Io.countOfReadCalls + 1
end

function Io.reset()
  Io.countOfReadCalls = 0
end

Io.reset()
return Io
