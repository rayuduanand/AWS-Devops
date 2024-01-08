#!/bin/bash

# Variable examples in a shell script

# String variable
name="John Doe"

# Integer variable
age=25

# Array variable
fruits=("Apple" "Banana" "Orange")

# Display the values of variables
echo "Name: $name"
echo "Age: $age"
echo "Fruits: ${fruits[@]}"

# Modify the values of variables
name="Jane Doe"
age=$((age + 5))
fruits+=("Grapes")

# Display the modified values
echo "Modified Name: $name"
echo "Modified Age: $age"
echo "Modified Fruits: ${fruits[@]}"
