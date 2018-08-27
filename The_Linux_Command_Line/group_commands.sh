#!/bin/bash

echo -e "A group command is a series of commands executed together as a group. The syntax is:\n{ command1; commandN; } - Notice the space between the curly braces, this is necessary."
echo -e "[info] Running group command { ls -l; echo "Listing of foo"; cat foo; } > group_command_output.txt ; cat group_command_output.txt"
{ ls -l; echo "Listing of foo"; cat foo; } > group_command_output.txt ; cat group_command_output.txt
