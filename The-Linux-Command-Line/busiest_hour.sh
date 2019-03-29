#!/bin/bash

usage () {
	echo "usage: ${0##*/} directory" >&2
}

# Check that the first argument is a directory
if [[ ! -d "$1" ]]; then
	usage
	exit 1
fi

# Initialise the array using brace expansion
for i in {0..23}; do
	hours[i]=0;
done

# Collect data
# stat shows everything the system knows about a file
# the -c option specifies the format and %y is a human readable timestamp
# cut prints specified parts of files
# the -c options prints only specified characters, in this case the 12th and 13th from stat which is the hours part of the timestamp 
for i in $(stat -c %y "$1"/* | cut -c 12-13); do
	# The # parameter expansion removes the shortest matching pattern, in this case the leading 0
	j="${i/#0}"
	((++hours[j]))
	((++count))
done

# Display data
echo -e "Hour\tFiles\tHour\tFiles"
echo -e "----\t-----\t----\t-----"
for i in {0..11}; do
	# convert into 24 hour times
	j=$((i + 12))
	# Format the output for the integers
	printf "%02d\t%d\t%02d\t%d\n" \
		"$i" \
		"${hours[i]}" \
		"$j" \
		"${hours[j]}"
done
printf "\nTotal files = %d\n" $count
