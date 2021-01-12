local class         = require "middleclass"
local OutputStream   = require "iostream.OutputStream"

local DataOutputStream = class("DataOutputStream", OutputStream)

function DataOutputStream:initialize(stream)
    self.stream = self.stream
end

-- TODO

return DataOutputStream