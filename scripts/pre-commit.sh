#!/bin/bash
luacheck iostream
STATUS=$?
[ $STATUS -ne 0 ] && exit 1

ldoc .
STATUS=$?
[ $STATUS -ne 0 ] && exit 1

git add docs