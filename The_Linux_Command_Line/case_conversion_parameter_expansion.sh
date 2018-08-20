#!/bin/bash

if [[ $1 ]]; then
	echo "Original input: $1"
	echo "${1,,}"
	echo "${1,}"
	echo "${1^^}"
	echo "${1^}"
fi
