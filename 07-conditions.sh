#!/bin/bash

#check if the number is Greater than or Not

NUMBER=$1

if [ $NUMBER -ge 10 ]

then 
    echo "$NUMBER   is > 10"
else
    echo "$NUMBER is Not> 10"

fi
