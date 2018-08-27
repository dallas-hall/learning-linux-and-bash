#!/bin/bash

a[100]=foo
# Number of array elements initialised
echo -e "[info] The number of elements being used is ${#a[@]}"

# Array element length
echo -e "[info] The array's length is ${#a[100]}"

