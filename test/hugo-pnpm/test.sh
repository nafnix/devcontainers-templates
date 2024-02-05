#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "pnpm" type pnpm
check "hugo" type hugo

# Report result
reportResults
