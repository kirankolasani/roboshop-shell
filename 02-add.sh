#!/bin/bash
# a=25
# b=34

a=$1
b=$2

add=$((a+b))

echo "Output is : $add" 
echo "plz print all args: $@"
echo "Plz print args count: $#"