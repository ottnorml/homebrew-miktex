#!/usr/bin/env sh

set -e

if [ "${MIKTEX_NEXT}" = "yes" ]; then
    installoptions=--devel
    versionname=devel
else
    versionname=stable
fi

echo Installing MiKTeX version: `brew info --json=v1 miktex | jq ".[0].versions.${versionname}"`

cmd="brew install --display-times --verbose ${installoptions} miktex"
echo "$cmd"
${cmd}

cmd="initexmf --report"
echo "$cmd"
${cmd}

. "${TRAVIS_BUILD_DIR}/travis-ci/_install.sh"
. "${TRAVIS_BUILD_DIR}/travis-ci/_test.sh"
