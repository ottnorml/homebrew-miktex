#!/usr/bin/env sh

set -ev

if [ "${MIKTEX_NEXT}" = "yes" ]; then
    installoptions=--devel
    versionname=devel
else
    versionname=stable
fi

echo Installing MiKTeX version: `brew info --json=v1 miktex | jq ".[0].versions.${versionname}"`
brew install --display-times --verbose ${installoptions} miktex
initexmf --report

. "${TRAVIS_BUILD_DIR}/travis-ci/_install.sh"
. "${TRAVIS_BUILD_DIR}/travis-ci/_test.sh"
