--- @module DataOutputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"

local DataOutputStream = class("DataOutputStream", OutputStream)

function DataOutputStream:initialize(stream)
    self.stream = stream
end

-- TODO

function DataOutputStream:flush()
    self.stream:flush()
end

function DataOutputStream:close()
    self.stream:close()
end

return DataOutputStream