#!/bin/bash
#Problem 1: Final Bash File
>$1
find $3 -name "*.c" >> $1

lines=$( wc -l < $1 )
echo $lines
comments=0
strings=0
for (( i=1; i<=$lines ; i++)){
	arr[$i]=$(head -$i $1 | tail -1)
	echo ${arr[$i]}
	awk -f $2 ${arr[$i]}
	comments=$(( $comments +  $( awk -f $2 ${arr[$i]}| head -1)  ))
	strings=$(( $strings + $( awk -f $2 ${arr[$i]}| head -2 | tail -1) ))
}
echo $comments
echo $strings
