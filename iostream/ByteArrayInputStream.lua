local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"

local ByteArrayInputStream = class("ByteArrayInputStream", InputStream)

function ByteArrayInputStream:initialize(array)
    self.array = array
    self.index = 1
end

function ByteArrayInputStream:readU8()
    local x = self.array[self.index]
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected unsigned byte, got " .. tostring(x)) end
    self.index = self.index + 1
    return x
end

return ByteArrayInputStream