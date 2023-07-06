#!/usr/bin/env bash

# Global variables
# https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
# Get script's name with BASH_SOURCE - https://stackoverflow.com/a/6355632
SCRIPT_NAME=$(basename "$BASH_SOURCE") 
# Get script's path with BASH_SOURCE - https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_PATH="$( dirname -- "${BASH_SOURCE[0]}" )"
SCRIPT_OUTPUT_PATH="$( dirname -- "${BASH_SOURCE[0]}" )/output"
# ANSI color codes - https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
NC='\e[0m'
# Toggle debugging with boolean - https://stackoverflow.com/questions/2953646/how-can-i-declare-and-use-boolean-variables-in-a-shell-script
GLOBAL_DEBUGGING=true

# Catch a lot of errors - https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
if [[ "$GLOBAL_DEBUGGING" = true ]]; then
  set -euox pipefail
else
  set -euo pipefail
fi

# Functions
error() {
	printf "${RED}[ERROR]${NC} %s\n" "$*"
	exit 1
}

step() {
	printf "[STEP] %s\n" "$*"
}

info() {
	printf "${GREEN}[INFO]${NC} %s\n" "$*"
}

warn() {
	printf "${YELLOW}[WARN]${NC} %s\n" "$*"
}

debug() {
	printf "${BLUE}[WARN]${NC} %s\n" "$*"
}

# Tests
info "Testing the info message."
step "Testing the step message."
warn "Testing the warn message."
debug "Testing the debug message."
error "Testing the error message."
