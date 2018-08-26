#!/bin/bash

# 5 ways to declare an array
declare -a days_number=(1  2  3  4  5  6  7)

days_short=(Sun Mon Tue Wed Thu Fri Sat)

days_full=([0]=Sunday [1]=Monday [2]=Tuesday)
days_full[3]=Wednesday
days_full[4]=Thursday
days_full[5]=Friday
days_full[6]=Saturday

days_letter[7]
days_letter[0]=S
days_letter[1]=M
days_letter[2]=T
days_letter[3]=W
days_letter[4]=T
days_letter[5]=F
days_letter[6]=S

# Manual array printing
echo ${days_number[0]}
echo ${days_short[0]}
echo ${days_full[0]}
echo ${days_letter[0]}
