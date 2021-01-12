--- @module InputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class = require "middleclass"

local InputStream = class("InputStream")

-- luacheck: push no unused args
function InputStream:readU8()
end

function InputStream:close()
end
-- luacheck: pop

return InputStream