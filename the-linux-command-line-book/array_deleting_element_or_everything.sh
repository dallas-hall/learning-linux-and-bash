#!/bin/bash

# create the array
foo=(a b c d e f)
echo -e "[info] The original array\n${foo[@]}"

# delete an element, use quotes to prevent pathname expansion.
unset 'foo[2]'
echo -e "[info] The array after unset 'foo[2]' which deletes a specific element\n${foo[@]}"

foo=
echo -e "[info] The array after unset foo= which deletes the first element.\n${foo[@]}"

# delete the entire array
unset foo
echo -e "[info] The array after unset foo which deletes the array\n${foo[@]}"


