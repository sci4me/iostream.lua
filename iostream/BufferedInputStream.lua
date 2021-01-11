local class         = require "middleclass"
local InputStream   = require "iostream.InputStream"

local BufferedInputStream = class("BufferedInputStream", InputStream)

BufferedInputStream.static.DEFAULT_BUFFER_SIZE = 8192

function BufferedInputStream:initialize(stream, bufferSize)
    self.stream = stream
    self.bufferSize = bufferSize and bufferSize or BufferedInputStream.static.DEFAULT_BUFFER_SIZE
    self.buffer = {}
    self.index = 1
    self.count = 0

    if type(self.bufferSize) ~= "number" then error("expected number, got " .. type(bufferSize)) end
    if self.bufferSize % 1 ~= 0 then error("expected integer, got " .. tostring(self.bufferSize)) end

    for i = 1, self.bufferSize do
        self.buffer[i] = 0
    end
end

function BufferedInputStream:readU8()
    if self.index >= self.count then
        self.index = 1
        self.count = 0
        while true do
            local x = self.class.super.readU8(self)
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