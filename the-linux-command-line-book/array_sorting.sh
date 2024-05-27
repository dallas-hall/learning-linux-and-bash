#!/bin/bash

# create the array
foo=(f e d c b a)
echo -e "[info] The original array.\n${foo[@]}"

# print the array contents and pipe the entire output to sort for sorting
foo_sorted=($(for i in "${foo[@]}"; do echo $i; done | sort))
echo -e "[info] The sorted array.\n${foo_sorted[@]}"
