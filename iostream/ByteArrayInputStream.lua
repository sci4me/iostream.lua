--- An input stream that reads from an array of bytes.
--
-- @module ByteArrayInputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"

local ByteArrayInputStream = class("ByteArrayInputStream", InputStream)

function ByteArrayInputStream:initialize(array)
    self.array = array
    self.index = 1
end

function ByteArrayInputStream:readU8()
    if self.index > #self.array then return nil end
    local x = self.array[self.index]
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected unsigned byte, got " .. tostring(x)) end
    self.index = self.index + 1
    return x
end

return ByteArrayInputStream