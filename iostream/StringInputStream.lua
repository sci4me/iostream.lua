--- @module StringInputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"
local byte          = string.byte
local strsub        = string.sub

local StringInputStream = class("StringInputStream", InputStream)

function StringInputStream:initialize(str)
    if type(str) ~= "string" then error("expected string, got " .. type(str)) end
    self.str = str
    self.index = 1
end

function StringInputStream:readU8()
    local x = byte(strsub(self.str, self.index, self.index))
    self.index = self.index + 1
    return x
end

-- luacheck: push no unused args
function StringInputStream:close()
end
--luacheck: pop

return StringInputStream