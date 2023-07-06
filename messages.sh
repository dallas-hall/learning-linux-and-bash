#!/usr/bin/env bash

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
