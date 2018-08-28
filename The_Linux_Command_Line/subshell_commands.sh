#!/bin/bash

echo -e "A subshell allows the grouping of commands, which is a series of commands executed together as a group. The syntax is:\n( command1; commandN; ) - The space isn't necessary between the () and its content."
echo -e "[info] Running subshell command ( ls -l; echo "Listing of foo"; cat foo; ) > subshell_command_output.txt ; cat subshell_command_output.txt"
( ls -l; echo "Listing of foo"; cat foo; ) > subshell_command_output.txt ; cat subshell_command_output.txt
