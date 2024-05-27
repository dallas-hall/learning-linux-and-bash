#!/bin/bash

animals=("a dog" "a cat" "a fish")
# print everything on a single line
echo "[info] array 1"
for i in ${animals[*]}; do
	echo $i;
done

# -e for echo tells echo to interpret the backslashes
echo -e "\n[info] array 2"
for i in ${animals[@]}; do
	echo $i;
done

echo -e "\n[info] array 3"
for i in "${animals[*]}"; do
	echo $i;
done

echo -e "\n[info] array 4"
# print everything with positional integrity
for i in "${animals[@]}"; do
	echo $i;
done
