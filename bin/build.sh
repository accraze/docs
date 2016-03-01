#!/bin/sh

# print commands on screen
set -x

rm -rf content/api
rm -rf content/cli
rm -rf content/files
rm -rf content/misc
rm -rf content/changelog

rm -rf content/policies

# The -p flag preserves file timestamps

cp -pr node_modules/npm/doc/cli content/
cp -pr node_modules/npm/doc/files content/
cp -pr node_modules/npm/doc/misc content/
mkdir content/changelog
split-md node_modules/npm/CHANGELOG.md '### v' '###' 'content/changelog/' 10
cp -pr node_modules/npm/CHANGELOG.md content/changelog/
echo "<!-- order:11 -->\n$(cat content/changelog/CHANGELOG.md)" > content/changelog/CHANGELOG.md
rm -f  content/misc/npm-index.md

cp -pr node_modules/@npm/policies content/

./bin/tree.js
