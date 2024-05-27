#!/bin/bash

# create an associative array (i.e. a map)
declare -A colours
colours["red"]="#ff0000"
colours["green"]="#00ff00"
colours["blue"]="#0000ff"

echo -e "[info] The associative array keys.\n${!colours[@]}"
echo -e "[info] The associative array values.\n${colours[@]}"
