local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"

local DataInputStream = class("DataInputStream", InputStream)

function DataInputStream:initialize(stream)
    self.stream = self.stream
end

-- TODO

function DataInputStream:close()
    self.stream:close()
end

return DataInputStream