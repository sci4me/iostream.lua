local class = require "middleclass"

local InputStream = class("InputStream")

function InputStream:readU8()
end

function InputStream:close()
end

return InputStream