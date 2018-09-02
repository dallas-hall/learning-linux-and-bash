#!/bin/bash

# Store the script name, strip the absolute path from $0
script_name="$(basename "$0")"

# Declare an associative array variables with nothing in them
declare -A files file_group file_owner groups owners

# Check that the supplied argument is a directory.
if [[ ! -d "$1" ]]; then
	echo "Usage: $script_name folder-name" >&2
	exit 1
fi

# Loop through the files in the directory
for i in "$1"/*; do
	# stat shows everything that the system knows about a file
	# -c is for specifying the printing format.
	# %U is for usernames
	owner="$(stat -c %U "$i")"
	# %G is for groups
	group="$(stat -c %G "$i")"
	# store all the files
	files["$i"]="$i"
	# store the user owner of the file
	file_owner["$i"]=$owners
	# store the group owner of the file
	file_group["$i"]=$group
	# Store the total files owned by user / group
	((++owners[$owner]))
	((++groups[$group]))
done

# Use array parameter expansion to show the associative array of all files 
{ for i in "${files[@]}"; do
	printf "%-40s %-10s %-10s\n" \
		"$i" "${file_owner["$i"]}" "${file_group["$i"]}"
done } | sort
echo

# Use array parameter expansion to show the associative array with totals per user
echo "File owners:"
{ for i in "${!owners[@]}"; do
	printf "%-10s: %5d file)s_\n" "$i" "${owners["$i"]}"
done } | sort
echo

# Use array parameter expansion to show the associative array with totals per group
echo "File group owners:"
{ for i in "${!groups[@]}"; do
	printf "%-10s: %5d file(s)\n" "$i" "${groups["$i"]}"
done } | sort
