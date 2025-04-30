#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "uv" type uv
check "sudo" type sudo

# Report result
reportResults
