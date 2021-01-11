local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"
local char          = string.char
local concat        = table.concat

local StringOutputStream = class("StringOutputStream", OutputStream)

function StringOutputStream:initialize()
    self.buffer = {}
end

function StringOutputStream:writeU8(x)
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected an unsigned byte, got " .. tostring(x)) end
    self.buffer[#self.buffer + 1] = char(x)
end

function StringOutputStream:flush()
end

function StringOutputStream:close()
end

function StringOutputStream:toString()
    return concat(self.buffer)
end

return StringOutputStream