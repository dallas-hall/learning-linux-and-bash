#!/bin/bash

# delcare the array
foo=(a b c)
echo -e "[info] Array element values.\n${foo[@]}"

# append some values to it
foo+=(d e f)
echo -e "[info] Array element values after concatentation.\n${foo[@]}"
