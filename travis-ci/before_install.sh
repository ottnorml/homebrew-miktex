#!/usr/bin/env sh

set -ev

brew update

( brew ls -1 | grep -w ghostscript ) || brew install --display-times ghostscript
( brew ls -1 | grep -w jq ) || brew install --display-times jq
( brew ls -1 | grep -w md5sha1sum ) || brew install --display-times md5sha1sum
