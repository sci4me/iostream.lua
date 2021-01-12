--- @module OutputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class = require "middleclass"

local OutputStream = class("OutputStream")

-- luacheck: push no unused args
function OutputStream:writeU8(x)
end

function OutputStream:flush()
end

function OutputStream:close()
end
-- luacheck: pop

return OutputStream