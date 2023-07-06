#!/usr/bin/env bash

# Global variables
# https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
# Get script's name with BASH_SOURCE - https://stackoverflow.com/a/6355632
SCRIPT_NAME=$(basename "$BASH_SOURCE") 
# Get script's path with BASH_SOURCE - https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_PATH="$( dirname -- "${BASH_SOURCE[0]}" )"

# Toggle debugging with boolean - https://stackoverflow.com/questions/2953646/how-can-i-declare-and-use-boolean-variables-in-a-shell-script
GLOBAL_DEBUGGING=true

# Catch a lot of errors - https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
if [[ "$GLOBAL_DEBUGGING" = true ]]; then
  set -euox pipefail
else
  set -euo pipefail
fi


# ANSI color codes
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m'

# Functions
error() {
	printf "${RED}[ERROR]${NC} %s\n" "$*"
	exit 1
}

step() {
	printf "${GREEN}[STEP]${NC} %s\n" "$*"
}

info() {
	printf "[INFO] %s\n" "$*"
}

warn() {
	printf "${YELLOW}[WARN]${NC} %s\n" "$*"
}

# Tests
step "Testing the step message."
info "Testing the info message."
warn "Testing the warn message."
error "Testing the error message."
