#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "sudo" type sudo

# Report result
reportResults
