#!/bin/bash

# =============================================================
# TOPIC: Passing Arguments to a Shell Script
# =============================================================
#
# Run this script with arguments to see it in action:
#   ./07-passing-arguments.sh Alice 30 developer
# =============================================================

# --- Positional Parameters ---
#
#   $0        name of the script itself
#   $1        first argument
#   $2        second argument
#   $N        Nth argument
#   $#        total number of arguments passed
#   $@        all arguments as separate words  (use in loops)
#   $*        all arguments as a single string

echo "=== Positional Parameters ==="
echo "Script name : $0"
echo "Argument 1  : $1"
echo "Argument 2  : $2"
echo "Argument 3  : $3"
echo "Total args  : $#"
echo "All args    : $@"

# --- Iterating over all arguments ---
echo ""
echo "=== Iterating \$@ ==="
index=1
for arg in "$@"; do
    echo "  Arg[$index] = $arg"
    (( index++ ))
done

# --- Validating required arguments ---
echo ""
echo "=== Argument Validation ==="

if [ $# -lt 2 ]; then
    echo "  Usage: $0 <name> <age> [role]"
    echo "  Example: $0 Alice 30 developer"
    echo "  (continuing demo with defaults...)"
    name="World"
    age=0
    role="unknown"
else
    name="${1}"
    age="${2}"
    role="${3:-guest}"    # default value if $3 is not provided
fi

echo "  Name : $name"
echo "  Age  : $age"
echo "  Role : $role"

# --- Default Values ---
#
#   ${var:-default}   use default if var is unset or empty
#   ${var:=default}   assign default if var is unset or empty
#   ${var:?message}   exit with error message if var is unset

echo ""
echo "=== Default Values ==="
environment="${4:-production}"    # 4th arg, or 'production' if missing
echo "  Environment : $environment"

# --- shift: consuming arguments one at a time ---
echo ""
echo "=== shift ==="
# 'shift' removes $1 and slides remaining args left.
# Useful for parsing flags/options manually.
set -- "alpha" "beta" "gamma" "delta"  # override positional params for demo

echo "  Before shift: \$1=$1  \$2=$2  \$3=$3  total=$#"
shift
echo "  After shift1: \$1=$1  \$2=$2  \$3=$3  total=$#"
shift 2
echo "  After shift3: \$1=$1  total=$#"

# --- getopts: parsing flags (e.g. -u user -p port) ---
echo ""
echo "=== getopts ==="
#
# Usage example:
#   ./07-passing-arguments.sh -u alice -p 8080 -v
#
# Reset positional params to a demo flag string
set -- -u alice -p 8080 -v

opt_user=""
opt_port=80
opt_verbose=false

while getopts ":u:p:v" opt; do
    case $opt in
        u) opt_user="$OPTARG"    ;;
        p) opt_port="$OPTARG"    ;;
        v) opt_verbose=true      ;;
        :) echo "  Option -$OPTARG requires an argument." ;;
        ?) echo "  Unknown option: -$OPTARG"              ;;
    esac
done

echo "  User    : ${opt_user:-not set}"
echo "  Port    : $opt_port"
echo "  Verbose : $opt_verbose"
