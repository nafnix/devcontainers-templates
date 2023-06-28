#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "pyenv" type -p pyenv >/dev/null
check "pdm" type -p pdm >/dev/null

# Report result
reportResults
