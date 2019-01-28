#!/usr/bin/env sh

set -ev

brew tap miktex/miktex "${TRAVIS_BUILD_DIR}"

brew install --display-times --only-dependencies miktex
