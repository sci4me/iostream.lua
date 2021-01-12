--- An output stream that wraps another output stream that buffers the output data.
--
-- @module BufferedOutputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local OutputStream  = require "iostream.OutputStream"

local BufferedOutputStream = class("iostream.BufferedOutputStream", OutputStream)

BufferedOutputStream.static.DEFAULT_BUFFER_SIZE = 8192

function BufferedOutputStream:initialize(stream, bufferSize)
    if not stream:isInstanceOf(OutputStream) then error("expected an instance of class OutputStream, got " .. tostring(stream)) end
    if bufferSize ~= nil and type(self.bufferSize) ~= "number" then error("expected number, got " .. type(bufferSize)) end
    if bufferSize ~= nil and self.bufferSize % 1 ~= 0 then error("expected integer, got " .. tostring(self.bufferSize)) end

    self.stream = stream
    self.bufferSize = bufferSize and bufferSize or BufferedOutputStream.static.DEFAULT_BUFFER_SIZE
    self.buffer = {}
    self.index = 1
    
    for i = 1, self.bufferSize do
        self.buffer[i] = 0
    end
end

function BufferedOutputStream:writeU8(x)
    if type(x) ~= "number" then error("expected number, got " .. type(x)) end
    if x < 0 or x > 255 or (x % 1 ~= 0) then error("expected an unsigned byte, got " .. tostring(x)) end
    if self.index > self.bufferSize then self:flush() end
    self.buffer[self.index] = x
    self.index = self.index + 1
end

function BufferedOutputStream:flush()
    for i = 1, self.index-1 do
        self.stream:writeU8(self.buffer[i])
    end
    self.index = 1
end

function BufferedOutputStream:close()
    self:flush()
    self.stream:close()
end

return BufferedOutputStream