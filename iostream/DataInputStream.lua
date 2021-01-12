--- @module DataInputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"

local DataInputStream = class("DataInputStream", InputStream)

function DataInputStream:initialize(stream)
    self.stream = stream
end

-- TODO

function DataInputStream:close()
    self.stream:close()
end

return DataInputStream