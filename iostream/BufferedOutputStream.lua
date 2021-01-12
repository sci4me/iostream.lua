local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"

local BufferedOutputStream = class("iostream.BufferedOutputStream", OutputStream)

BufferedOutputStream.static.DEFAULT_BUFFER_SIZE = 8192

function BufferedOutputStream:initialize(stream, bufferSize)
    self.stream = stream
    self.bufferSize = bufferSize and bufferSize or BufferedOutputStream.static.DEFAULT_BUFFER_SIZE
    self.buffer = {}
    self.index = 1

    if type(self.bufferSize) ~= "number" then error("expected number, got " .. type(bufferSize)) end
    if self.bufferSize % 1 ~= 0 then error("expected integer, got " .. tostring(self.bufferSize)) end
    
    for i = 1, self.bufferSize do
        self.buffer[i] = 0
    end
end

function BufferedOutputStream:writeU8(x)
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected an unsigned byte, got " .. tostring(x)) end
    if self.index == self.bufferSize then self:flush() end
    self.buffer[self.index] = x
    self.index = index + 1
end

function BufferedOutputStream:flush()
    for i = 1, self.index do
        self.class.super.writeU8(self, self.buffer[i])
    end
    self.index = 0
end

function BufferedOutputStream:close()
    self:flush()
    self.class.super.close(self)
end

return BufferedOutputStream