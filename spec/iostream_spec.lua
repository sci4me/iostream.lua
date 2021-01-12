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
        
    end)
end)