#!/bin/bash
# Look for the longest string within a file.

# while the string length isn't 0
while [[ -n "$1" ]]; do
	# if the file exists and is readable
	if [[ -r "$1" ]]; then
		max_word=
		max_len=0
		# strings is a GNU program that generates a list of words from files.
		# Notice the lack of quoting around the command substituion, as we want word splitting to occur
		# The optional in word is to process lists, without in it will process positional parameters
		for i in $(strings "$1"); do
			# echo -n ignores the trailing newline
			# wc -m counts characters
			len="$(echo -n "$i" | wc -m )"
			if (( len > max_len)); then
				max_len=$len
				max_word="$i"
			fi
		done
		echo "$1: '$max_word' ($max_len characters)"
	fi
	shift
done
