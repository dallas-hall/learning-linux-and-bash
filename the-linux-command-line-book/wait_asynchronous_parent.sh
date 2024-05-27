#!/bin/bash

print_message () {
	echo -e "[info]\t"$1
}

print_message "Parent: job starting."
print_message "Parent: job launching child job."
# launch into background
./wait_asynchronous_child.sh &
pid=$!
print_message "Parent: job reporting that child job with PID $pid is running."
print_message "Parent: is continuing."
sleep 2
print_message "Parent: is pausing to wait for child to finish."
wait "$pid"
print_message "Parent: the child job has finished."
print_message "Parent: parent has finished. Exiting."
