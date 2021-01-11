local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"
local byte          = string.byte

local FileInputStream = class("FileInputStream", InputStream)

function FileInputStream:initialize(path)
    self.fh = io.open(path, "rb")
    if not self.fh then error("file not found: " .. tostring(path)) end
end

function FileInputStream:readU8()
    return byte(self.fh:read(1))
end

function FileInputStream:close()
    self.fh:close()
end

return FileInputStream