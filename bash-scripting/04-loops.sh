#!/bin/bash

# =============================================================
# TOPIC: Loops in Bash
# =============================================================

# --- for Loop: range ---
echo "=== for loop (range) ==="
for i in {1..5}; do
    echo "  Iteration: $i"
done

# --- for Loop: C-style ---
echo ""
echo "=== for loop (C-style) ==="
for (( i=0; i<5; i++ )); do
    echo "  i = $i"
done

# --- for Loop: over a list ---
echo ""
echo "=== for loop (list) ==="
for fruit in apple banana cherry; do
    echo "  Fruit: $fruit"
done

# --- for Loop: over an array ---
echo ""
echo "=== for loop (array) ==="
servers=("web-01" "web-02" "db-01" "cache-01")

for server in "${servers[@]}"; do
    echo "  Checking server: $server"
done

# --- for Loop: over files ---
echo ""
echo "=== for loop (files in current dir) ==="
for file in *.sh; do
    echo "  Script: $file"
done

# --- while Loop ---
echo ""
echo "=== while loop ==="
counter=1

while [ $counter -le 5 ]; do
    echo "  Counter: $counter"
    (( counter++ ))
done

# --- while Loop: reading a file line by line ---
echo ""
echo "=== while loop (read lines) ==="
# Write a temp file to demo with
tmpfile=$(mktemp)
printf "line one\nline two\nline three\n" > "$tmpfile"

while IFS= read -r line; do
    echo "  Read: $line"
done < "$tmpfile"

rm -f "$tmpfile"

# --- until Loop ---
# Runs as long as the condition is FALSE (opposite of while).
echo ""
echo "=== until loop ==="
n=5

until [ $n -le 0 ]; do
    echo "  Countdown: $n"
    (( n-- ))
done

# --- break and continue ---
echo ""
echo "=== break and continue ==="
for i in {1..10}; do
    if [ $i -eq 4 ]; then
        echo "  Skipping 4 (continue)"
        continue
    fi
    if [ $i -eq 7 ]; then
        echo "  Stopping at 7 (break)"
        break
    fi
    echo "  i = $i"
done

# --- Nested Loops ---
echo ""
echo "=== nested loops ==="
for row in 1 2 3; do
    for col in A B C; do
        printf "  [%d%s] " "$row" "$col"
    done
    echo ""
done
