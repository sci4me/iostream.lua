--- An output stream that writes to a file.
--
-- @module FileOutputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"
local char          = string.char

local FileOutputStream = class("FileOutputStream", OutputStream)

function FileOutputStream:initialize(path)
    self.fh = io.open(path, "wb")
end

function FileOutputStream:writeU8(x)
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected an unsigned byte, got " .. tostring(x)) end
    self.fh:write(char(x))
end

function FileOutputStream:flush()
    self.fh:flush()
end

function FileOutputStream:close()
    self.fh:close()
end

return FileOutputStream