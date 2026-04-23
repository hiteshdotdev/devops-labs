#!/bin/bash

# =============================================================
# TOPIC: Variables in Bash
# =============================================================

# --- Declaring Variables ---
# No spaces around '=' when assigning.
name="Hitesh"
age=25
pi=3.14

echo "Name : $name"
echo "Age  : $age"
echo "Pi   : $pi"

# --- Reading User Input ---
# read stores input into a variable at runtime.
# (Commented out so the script runs non-interactively.)
# read -p "Enter your city: " city
# echo "City: $city"

# --- Variable Types ---

# Integers (declare -i enforces integer type)
declare -i count=10
count=count+5
echo "Count: $count"        # 15

# Read-only variables (constants)
readonly MAX_RETRIES=3
echo "Max retries: $MAX_RETRIES"
# MAX_RETRIES=5  # This would throw an error

# --- Environment Variables ---
# These are inherited by child processes.
export APP_ENV="development"
echo "App environment: $APP_ENV"

# Some built-in environment variables:
echo "Home directory : $HOME"
echo "Current user   : $USER"
echo "Hostname       : $HOSTNAME"
echo "Working dir    : $PWD"

# --- Command Substitution ---
# Capture the output of a command into a variable.
today=$(date +%Y-%m-%d)
file_count=$(ls | wc -l)
echo "Today's date      : $today"
echo "Files in this dir : $file_count"

# --- String Operations ---
greeting="Hello, World!"

echo "Original  : $greeting"
echo "Length    : ${#greeting}"           # string length
echo "Uppercase : ${greeting^^}"          # convert to uppercase
echo "Lowercase : ${greeting,,}"          # convert to lowercase
echo "Substring : ${greeting:7:5}"        # substring (offset:length)
echo "Replace   : ${greeting/World/Bash}" # replace first match

# --- Arrays ---
fruits=("apple" "banana" "cherry" "date")

echo ""
echo "All fruits    : ${fruits[@]}"
echo "First fruit   : ${fruits[0]}"
echo "Third fruit   : ${fruits[2]}"
echo "Array length  : ${#fruits[@]}"

# Add an element
fruits+=("elderberry")
echo "After append  : ${fruits[@]}"

# Slice the array (offset:length)
echo "Slice [1..2]  : ${fruits[@]:1:2}"
