#!/bin/bash

for((i=0;i<16;i++)); do
	echo $((1<<i));
done
