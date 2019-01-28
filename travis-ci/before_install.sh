#!/usr/bin/env sh

set -e

exec 3>&1
special_echo () {
    echo "$@" >&3
}
exec 1> /dev/null

cmd="brew update"
special_echo "$cmd > /dev/null"
${cmd}

formulas="$( ( brew ls -1 | grep -w ghostscript > /dev/null ) || echo "ghostscript " )"
formulas="$formulas$( ( brew ls -1 | grep -w jq > /dev/null ) || echo "jq " )"
formulas="$formulas$( ( brew ls -1 | grep -w md5sha1sum > /dev/null ) || echo "md5sha1sum" )"
cmd="brew install $formulas"
special_echo "$cmd > /dev/null"
${cmd}
