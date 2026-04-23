#!/bin/bash

# =============================================================
# TOPIC: Conditional Statements
# =============================================================

# --- if / elif / else ---
score=72

if [ $score -ge 90 ]; then
    echo "Grade: A"
elif [ $score -ge 75 ]; then
    echo "Grade: B"
elif [ $score -ge 60 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi

# --- Comparison Operators ---
#
# Numeric:
#   -eq   equal to
#   -ne   not equal to
#   -gt   greater than
#   -lt   less than
#   -ge   greater than or equal to
#   -le   less than or equal to
#
# String:
#   =     equal
#   !=    not equal
#   -z    string is empty
#   -n    string is not empty
#
# File tests:
#   -f    is a regular file
#   -d    is a directory
#   -e    exists
#   -r    readable
#   -w    writable
#   -x    executable

# --- String Comparison ---
os="linux"

if [ "$os" = "linux" ]; then
    echo "Running on Linux"
else
    echo "Not Linux"
fi

# --- File / Directory Test ---
target_dir="/tmp"

if [ -d "$target_dir" ]; then
    echo "$target_dir exists and is a directory"
fi

if [ ! -f "/tmp/missing_file.txt" ]; then
    echo "File does not exist (expected)"
fi

# --- Logical Operators ---
#   &&   AND
#   ||   OR
#   !    NOT

cpu_cores=4
ram_gb=8

if [ $cpu_cores -ge 2 ] && [ $ram_gb -ge 4 ]; then
    echo "System meets minimum requirements"
fi

if [ $cpu_cores -lt 2 ] || [ $ram_gb -lt 2 ]; then
    echo "System is underpowered"
else
    echo "System is adequate"
fi

# --- Double Brackets [[ ]] ---
# Extended test with regex support and no word-splitting issues.
filename="report_2024.csv"

if [[ "$filename" == *.csv ]]; then
    echo "$filename is a CSV file"
fi

if [[ "$filename" =~ ^report_[0-9]{4}\.csv$ ]]; then
    echo "$filename matches the expected naming pattern"
fi

# --- case Statement ---
# Cleaner alternative to long if/elif chains.
day="Tuesday"

case $day in
    Monday)
        echo "Start of the work week" ;;
    Tuesday | Wednesday | Thursday)
        echo "Midweek day" ;;
    Friday)
        echo "End of the work week" ;;
    Saturday | Sunday)
        echo "Weekend!" ;;
    *)
        echo "Unknown day" ;;
esac
