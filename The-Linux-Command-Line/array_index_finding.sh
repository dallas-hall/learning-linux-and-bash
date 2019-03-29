#!/bin/bash

# delcare an array with 7 indices and populate 3 in varying positions so there is gaps between indices
foo=([2]=a [4]=b [6]=c)

echo -e "[info] Show element values"
for i in "${foo[@]}"; do
	echo $i;
done

echo -e "\n[info] Show indices with values" 
for i in "${!foo[@]}"; do
	echo $i;
done

