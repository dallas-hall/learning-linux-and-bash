#!/bin/bash

# User parameter expansion to get the basename
# positional paramter 0 stores the absolute path of the script
# ${paramter##pattern} removes the longest pattern matched from the parameter supplied. 
PROGRAM_NAME="${0##*/}"
echo "$PROGRAM_NAME"

usage () {
	cat <<- 'EOF'
	Usage: $PROGRAM_NAME PRINCIPAL INTEREST MONTHS

	Where:

	PRINCIPAL is the amount of the loan.
	INTEREST is teh APR as a number (7% = 0.07).
	MONTHS is the length of the loan's term.

	EOF
}

# Check the number of parameters
if (($# != 3)); then
	usage
	exit 1
fi

principal=$1
interest=$2
months=$3

# use bc to perform the calculation
bc <<- EOF
	scale = 10
	i = $interest / 12
	p = $principal
	n = $months
	a = p * ((i * ((1 + i) ^ n)) / (((1 + i) ^ n) - 1))
	print a, "\n"
EOF
