#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "pyenv" type pyenv
check "python" type python
check "pip" type pip
check "pdm" type pdm

# Report result
reportResults
