--- An output stream that writes to an array of bytes.
--
-- @module ByteArrayOutputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"

local ByteArrayOutputStream = class("ByteArrayOutputStream", OutputStream)

function ByteArrayOutputStream:initialize()
    self.array = {}
    self.index = 1
end

function ByteArrayOutputStream:writeU8(x)
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected an unsigned byte, got " .. tostring(x)) end
    self.array[self.index] = x
    self.index = self.index + 1
end

function ByteArrayOutputStream:toByteArray()
    return self.array
end

return ByteArrayOutputStream