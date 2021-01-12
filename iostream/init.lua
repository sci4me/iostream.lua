---  A simple input/output stream framework based on `java.io`
--
-- @module iostream
-- @author sci4me
-- @license MIT
-- @copyright Scitoshi Nakayobro 2021

return setmetatable({
    _DESCRIPTION    = "A simple input/output stream framework based on java.io",
    _URL            = "https://github.com/sci4me/iostream.lua",
    _VERSION        = "iostream.lua 0.1.0",
    _LICENSE        = [[
        MIT License

        Copyright (c) 2021 Scitoshi Nakayobro

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
    ]],
    InputStream             = require "iostream.InputStream",
    OutputStream            = require "iostream.OutputStream",
    StringInputStream       = require "iostream.StringInputStream",
    StringOutputStream      = require "iostream.StringOutputStream",
    ByteArrayInputStream    = require "iostream.ByteArrayInputStream",
    ByteArrayOutputStream   = require "iostream.ByteArrayOutputStream",
    FileInputStream         = require "iostream.FileInputStream",
    FileOutputStream        = require "iostream.FileOutputStream",
    BufferedInputStream     = require "iostream.BufferedInputStream",
    BufferedOutputStream    = require "iostream.BufferedOutputStream",
    DataInputStream         = require "iostream.DataInputStream",
    DataOutputStream        = require "iostream.DataOutputStream"
}, {
    -- luacheck: push no unused args
    __newindex = function(t, k, v)
        error("cannot modify read-only table")
    end,
    --luacheck: pop
    __metatable = false
})