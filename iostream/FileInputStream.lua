local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"
local byte          = string.byte

local FileInputStream = class("FileInputStream", InputStream)

function FileInputStream:initialize(path)
    self.fh = io.open(path, "rb")
    if not self.fh then error("file not found: " .. tostring(path)) end
end

function FileInputStream:readU8()
    local x = self.fh:read(1)
    if x == nil then return x end
    return byte(x)
end

function FileInputStream:close()
    self.fh:close()
end

return FileInputStream