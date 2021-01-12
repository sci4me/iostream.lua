local char      = string.char
local byte      = string.byte
local substr    = string.sub
local strlen    = string.len

describe("iostream.lua", function()
    local iostream
    local InputStream
    local OutputStream
    local StringInputStream
    local StringOutputStream
    local ByteArrayInputStream
    local ByteArrayOutputStream
    local FileInputStream
    local FileOutputStream
    local BufferedInputStream
    local BufferedOutputStream
    local DataInputStream
    local DataOutputStream

    it("loads", function()
        iostream = require "iostream"
        InputStream = iostream.InputStream
        OutputStream = iostream.OutputStream
        StringInputStream = iostream.StringInputStream
        StringOutputStream = iostream.StringOutputStream
        ByteArrayInputStream = iostream.ByteArrayInputStream
        ByteArrayOutputStream = iostream.ByteArrayOutputStream
        FileInputStream = iostream.FileInputStream
        FileOutputStream = iostream.FileOutputStream
        BufferedInputStream = iostream.BufferedInputStream
        BufferedOutputStream = iostream.BufferedOutputStream
        DataInputStream = iostream.DataInputStream
        DataOutputStream = iostream.DataOutputStream
    end)

    describe("StringInputStream", function()
        it("works", function()
            local str = "foobar123"
        
            local s = StringInputStream(str)

            for i = 1, strlen(str) do
                assert(s:readU8() == byte(substr(str, i, i)))
            end
            assert(s:readU8() == nil)
        end)
    end)

    describe("StringOutputStream", function()
        it("works", function()
            local s = StringOutputStream()

            local str = "foobar123"
            for i = 1, strlen(str) do
                s:writeU8(byte(substr(str, i, i)))
            end

            assert(s:toString() == str)
        end)
    end)

    describe("ByteArrayInputStream", function()
        it("works", function()
            local data = { 0, 1, 250, 170, 66, 92, 255, 42 }

            local s = ByteArrayInputStream(data)

            for i = 1, #data do
                assert(s:readU8() == data[i])
            end
        end)
    end)

    describe("ByteArrayOutputStream", function()            
        it("works", function()
            local data = { 0, 1, 250, 170, 66, 92, 255, 42 }
        
            local s = ByteArrayOutputStream(data)
            
            for i = 1, #data do
                s:writeU8(data[i])
            end

            local r = s:toByteArray()
            assert(#r == #data)
            for i = 1, #r do
                assert(r[i] == data[i])
            end
        end)
    end)
end)