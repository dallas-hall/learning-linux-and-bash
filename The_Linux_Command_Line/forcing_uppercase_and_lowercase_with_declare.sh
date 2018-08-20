#!/bin/bash

# declare the variables to force case when they are assigned data
declare -u upper
declare -l lower

# check for at least 1 positional parameter, and convert it if it exists.
if [[ $1 ]]; then
	upper="$1"
	lower="$1"
	echo "Original input: $1"
	echo "UPPERCASE: $upper"
	echo "lowercase: $lower"
fi
