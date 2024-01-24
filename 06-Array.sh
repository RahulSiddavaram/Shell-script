#!/bin/bash

# This is called ARRAY, Instead of single value it can hold multple values
PERSONS=("Ramesh" "Suresh" "Rahul")


echo "First Person: ${PERSONS[0]}"

echo "ALL The Persons in A GROUP: ${PERSONS[@]}"
