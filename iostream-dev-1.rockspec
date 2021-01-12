rockspec_format = "3.0"

package = "iostream"
version = "dev-1"

source = {
    url = "git://github.com/sci4me/iostream.git",
    branch = "master"
}

description = {
    homepage = "https://github.com/sci4me/iostream.lua",
    issues_url = "https://github.com/sci4me/iostream.lua/issues",
    maintainer = "sci4me",
    license = "MIT",
    labels = {
        "serialization"
    }
}

dependencies = {
    "lua >= 5.1",
    "bit32",
    "middleclass"
}

build = {
    type = "builtin",
    modules = {
        ["iostream"] = " iostream/init.lua",
        ["iostream.InputStream"] = "iostream/InputStream.lua",
        ["iostream.OutputStream"] = "iostream/OutputStream.lua",
        ["iostream.StringInputStream"] = "iostream/StringInputStream.lua",
        ["iostream.StringOutputStream"] = "iostream/StringOutputStream.lua",
        ["iostream.ByteArrayInputStream"] = "iostream/ByteArrayInputStream.lua",
        ["iostream.ByteArrayOutputStream"] = "iostream/ByteArrayOutputStream.lua",
        ["iostream.FileInputStream"] = "iostream/FileInputStream.lua",
        ["iostream.FileOutputStream"] = "iostream/FileOutputStream.lua",
        ["iostream.BufferedInputStream"] = "iostream/BufferedInputStream.lua",
        ["iostream.BufferedOutputStream"] = "iostream/BufferedOutputStream.lua",
        ["iostream.DataInputStream"] = "iostream/DataInputStream.lua",
        ["iostream.DataOutputStream"] = "iostream/DataOutputStream.lua"
    },
    copy_directories = {
        "docs",
        "spec"
    }
}

test_dependencies = {
    "busted",
    "busted-htest",
    "luassert"
}

test = {
    type = "busted"
}