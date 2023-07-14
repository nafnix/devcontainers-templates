#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "python" type python
check "pip" type pip
check "sudo" type sudo

# Report result
reportResults
