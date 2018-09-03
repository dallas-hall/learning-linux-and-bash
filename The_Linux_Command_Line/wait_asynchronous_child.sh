#!/bin/bash

print_message () {
	echo -e "[info]\t"$1
}

print_message "Child: job running."
sleep 5
print_message "Child: job finished."
