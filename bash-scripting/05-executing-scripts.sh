#!/bin/bash

# =============================================================
# TOPIC: Executing a Shell Script
# =============================================================

# There are several ways to run a shell script.
#
# 1. USING THE INTERPRETER DIRECTLY
#    Pass the script as an argument to bash/sh — no execute
#    permission needed on the file.
#
#      bash  05-executing-scripts.sh
#      sh    05-executing-scripts.sh
#
# 2. MAKING THE SCRIPT EXECUTABLE (chmod) THEN RUNNING IT
#    This is the standard approach in production.
#
#      chmod +x 05-executing-scripts.sh   # grant execute permission
#      ./05-executing-scripts.sh          # run from current directory
#
#    The ./ prefix tells the shell to look in the current directory,
#    because '.' (current dir) is usually NOT in $PATH for safety.
#
# 3. SOURCING THE SCRIPT  (. or source)
#    Runs the script in the CURRENT shell process instead of a
#    sub-shell. Any variables or functions defined persist in the
#    caller's environment.
#
#      source 05-executing-scripts.sh
#      .      05-executing-scripts.sh     # shorthand
#
# 4. PLACING THE SCRIPT IN A $PATH DIRECTORY
#    Once the file is executable you can call it by name from anywhere.
#
#      cp 05-executing-scripts.sh /usr/local/bin/myscript
#      myscript      # works from any directory

# --- Understanding Permissions ---
# ls -l output example:
#   -rwxr-xr-x  1 hitesh staff  412 Apr 22 10:00 script.sh
#    ^^^           owner  group
#    |||
#    ||+-- execute (x)
#    |+--- write   (w)
#    +---- read    (r)
#
# chmod symbolic modes:
#   chmod +x file       add execute for all
#   chmod u+x file      add execute for owner only
#   chmod 755 file      rwx r-x r-x  (common for scripts)
#   chmod 644 file      rw- r-- r--  (common for data files)

# --- Sub-shell vs Current Shell ---
# bash script.sh   -> runs in a NEW sub-shell; parent env unchanged
# source script.sh -> runs in the CURRENT shell; changes persist

# --- Demo: show how this script is being executed ---
echo "Script path       : $0"
echo "Script PID        : $$"
echo "Parent PID (PPID) : $PPID"
echo "Current shell     : $(ps -p $$ -o comm=)"

# Check whether we are sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo ""
    echo "This script is being EXECUTED (run as a subprocess)."
else
    echo ""
    echo "This script is being SOURCED (running inside the current shell)."
fi
