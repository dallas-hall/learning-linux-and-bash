#!/bin/bash

base2=11111111
base8=0377
base10=255
base16=0xff
base64='w78='

echo "The base10 number $base10 is $(($base10)) in base10."
echo "The base8 number $base8 is $(($base8)) in base10."
echo "The base16 number $base16 is $(($base16)) in base10"
echo "The base2 number $base2 is $((2#$base2)) in base10"
#echo "The base64 number $base64 is $((64#"$base64")) in base10"
