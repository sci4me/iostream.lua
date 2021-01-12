--- An input stream that wraps another input stream that buffers the input data.
--
-- @module BufferedInputStream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"

local BufferedInputStream = class("BufferedInputStream", InputStream)

BufferedInputStream.static.DEFAULT_BUFFER_SIZE = 8192

function BufferedInputStream:initialize(stream, bufferSize)
    if not stream:isInstanceOf(InputStream) then error("expected an instance of class InputStream, got " .. tostring(stream)) end
    if bufferSize ~= nil and type(bufferSize) ~= "number" then error("expected number, got " .. type(bufferSize)) end
    if bufferSize ~= nil and bufferSize % 1 ~= 0 then error("expected integer, got " .. tostring(bufferSize)) end
    
    self.stream = stream
    self.bufferSize = bufferSize and bufferSize or BufferedInputStream.static.DEFAULT_BUFFER_SIZE
    self.buffer = {}
    self.index = 1
    self.count = 0

    for i = 1, self.bufferSize do
        self.buffer[i] = 0
    end
end

function BufferedInputStream:readU8()
    if self.index > self.count then
        self.index = 1
        self.count = 0
        while true do
            local x = self.stream:readU8()
            if not x then break end
            self.count = self.count + 1
            self.buffer[self.count] = x
        end
    end

    if self.count == 0 then
        return nil
    end

    local x = self.buffer[self.index]
    self.index = self.index + 1
    return x
end

return BufferedInputStream