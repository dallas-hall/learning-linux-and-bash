#!/bin/bash

# mkfifo creates a named pipe
mkfifo pipe1

# The p at the start shows that it is a named pipe
ls -l pipe1


cat <<- '_EOF_'
[info] Running in TTY1
ls -l > pipe1

[info] The pipe will hang TTY1 because it hasn't received anything. To clear and close the pipe, in TTY2 run
cat < pipe1
_EOF_

ls -l > pipe1
