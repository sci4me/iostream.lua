local class = require "middleclass"

local OutputStream = class("OutputStream")

function OutputStream:writeU8(x)
end

function OutputStream:flush()
end

function OutputStream:close()
end

return OutputStream