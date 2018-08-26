#!/bin/bash

# 4 ways to declare an array
declare -a days_number=(1  2  3  4  5  6  7)
days_short=(Sun Mon Tue Wed Thu Fri Sat)
days_full=([0]=Sunday [1]=Monday [2]=Tuesday)
days_full[3]=Wednesday
days_full[4]=Thursday
days_full[5]=Friday
days_full[6]=Saturday

# Manual array printing
echo ${days_number[0]}
echo ${days_short[0]}
echo ${days_full[0]}
