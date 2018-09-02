#!/bin/bash

while read attr links owner group size date time filename; do
	cat <<- _EOF_
		Filename: $filename
		Size: $size
		Owner: $owner
		Group: $group
		Modified: $date $time
		Links: $links
		Attributes: $attr
	_EOF_
# Use process substituion for standard output. This treats the output of a subshell as an ordinary file during redirection.
done < <(ls -l | tail -n +2)
