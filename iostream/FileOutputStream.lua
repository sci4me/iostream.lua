local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"
local char          = string.char

local FileOutputStream = class("FileOutputStream", OutputStream)

function FileOutputStream:initialize(path)
    self.fh = io.open(path, "wb")
end

function FileOutputStream:writeU8(x)
    self.fh:write(char(x))
end

function FileOutputStream:flush()
    self.fh:flush()
end

function FileOutputStream:close()
    self.fh:close()
end

return FileOutputStream