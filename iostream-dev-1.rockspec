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
        ["iostream"] = "src/iostream/init.lua"
    },
    copy_directories = {
        "docs",
        "spec"
    }
}

test_dependencies = {
    "busted",
    "busted-htest"
}

test = {
    type = "busted"
}