#!/bin/bash

exit_on_signal_SIGINT () {
	echo "\nScript interrupted." 2>&1
	exit 0
}

exit_on_signal_SIGTERM () {
	echo "\nScript terminated." 2>&1
	exit 0
}

# ctrl + c
trap exit_on_signal_SIGINT SIGINT

# 
trap exit_on_signal_SIGTERM SIGTERM

for i in {1..5}; do
	echo "Iteration $i of 5"
	sleep 5
done
