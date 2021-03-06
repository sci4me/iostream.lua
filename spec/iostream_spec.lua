-- luacheck: push no unused

local assert    = require "luassert"
local char      = string.char
local byte      = string.byte
local substr    = string.sub
local strlen    = string.len

local path_separator    = substr(package.config, 1, 1)
local is_windows        = path_separator == '\\'

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

    local to_be_deleted = {}

    teardown(function()
        for i = 1, #to_be_deleted do
            os.remove(to_be_deleted[i])
        end
    end)

    local function tmpname()
        local path = os.tmpname()
        if is_windows and not path:find(':') then
            path = os.getenv("TEMP") .. path
        end
        to_be_deleted[#to_be_deleted + 1] = path
        return path
    end

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
                assert.are.equal(byte(substr(str, i, i)), s:readU8())
            end
            assert.are.equal(nil, s:readU8())
        end)
    end)

    describe("StringOutputStream", function()
        it("works", function()
            local str = "foobar123"
            
            local s = StringOutputStream()

            for i = 1, strlen(str) do
                s:writeU8(byte(substr(str, i, i)))
            end

            assert.are.equal(str, s:toString())
        end)
    end)

    describe("ByteArrayInputStream", function()
        it("works", function()
            local data = { 0, 1, 250, 170, 66, 92, 255, 42 }

            local s = ByteArrayInputStream(data)

            for i = 1, #data do
                assert.are.equal(data[i], s:readU8())
            end
            assert.are.equal(nil, s:readU8())
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
            assert.are.equal(#data, #r)
            for i = 1, #r do
                assert.are.equal(data[i], r[i])
            end
        end)
    end)

    describe("FileInputStream", function()
        local data = { 0, 1, 250, 170, 66, 92, 255, 42 }
        local path = tmpname()
        
        local fh = io.open(path, "wb")
        for i = 1, #data do
            fh:write(char(data[i]))
        end
        fh:close()

        local s = FileInputStream(path)

        for i = 1, #data do
            assert.are.equal(data[i], s:readU8())
        end
        assert.are.equal(nil, s:readU8())
        s:close()
    end)

    describe("FileOutputStream", function()
        it("works", function()
            local data = { 0, 1, 250, 170, 66, 92, 255, 42 }
            local path = tmpname()

            local s = FileOutputStream(path)

            for i = 1, #data do
                s:writeU8(data[i])
            end
            s:close()

            local fh = io.open(path, "rb")
            for i = 1, #data do
                assert.are.equal(data[i], byte(fh:read(1)))
            end
            fh:close()
        end)
    end)

    describe("BufferedInputStream", function()
        it("works", function()
            local data = { 0, 1, 250, 170, 66, 92, 255, 42 }
            local b = ByteArrayInputStream(data)
            local s = BufferedInputStream(b)

            for i = 1, #data do
                assert.are.equal(data[i], s:readU8())
            end
            assert.are.equal(nil, s:readU8())

            -- TODO: improve this test (write more..); we aren't really testing the actual buffering
        end)
    end)

    describe("BufferedOutputStream", function()
        it("works", function()
            local data = { 0, 1, 250, 170, 66, 92, 255, 42 }
            local b = ByteArrayOutputStream()
            local s = BufferedOutputStream(b)
    
            for i = 1, #data do
                s:writeU8(data[i])
            end

            print(s.index)

            assert.are.equal(0, #b:toByteArray())

            s:flush()

            local xs = b:toByteArray()
            assert.are.equal(#data, #xs)
            for i = 1, #data do
                assert.are.equal(xs[i], data[i])
            end
        end)
    end)
end)

-- luacheck: pop