#!/bin/bash
# Look for the longest string within a file.

# Without the in keyword, for will process the positional paramters
for i; do
	# if the file exists and is readable
	if [[ -r "$i" ]]; then
		max_word=
		max_len=0
		# strings is a GNU program that generates a list of words from files.
		# Notice the lack of quoting around the command substituion, as we want word splitting to occur
		# The optional in word is to process lists, without in it will process positional parameters
		for j in $(strings "$i"); do
			# {#variable} is a parameter expansion that removes the shortest match. In this case it will leave the longest match of the line.
			len="${#j}"
			if (( len > max_len)); then
				max_len=$len
				max_word="$j"
			fi
		done
		echo "$i: '$max_word' ($max_len characters)"
	fi
	# Don't need shift here because the for without the in will cover it.
done
