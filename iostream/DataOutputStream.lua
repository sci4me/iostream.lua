local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"

local DataOutputStream = class("DataOutputStream", OutputStream)

function DataOutputStream:initialize(stream)
    self.stream = self.stream
end

-- TODO

function DataOutputStream:flush()
    self.stream:flush()
end


function DataOutputStream:close()
    self.stream:close()
end


return DataOutputStream