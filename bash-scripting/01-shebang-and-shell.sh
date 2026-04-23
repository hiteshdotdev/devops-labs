#!/bin/bash

# =============================================================
# TOPIC: Shebang Statement & What is a Shell
# =============================================================

# --- What is a Shell? ---
# A shell is a command-line interpreter that provides an interface
# between the user and the operating system kernel.
# It reads commands (typed or from a script) and executes them.
#
# Common shells:
#   bash   -> Bourne Again SHell  (most common on Linux)
#   sh     -> Bourne Shell        (original UNIX shell)
#   zsh    -> Z Shell             (default on macOS)
#   ksh    -> Korn Shell
#   fish   -> Friendly Interactive Shell
#
# To check your current shell:
#   echo $SHELL
#
# To list all available shells on the system:
#   cat /etc/shells

# --- What is a Shebang? ---
# The very first line of this file: #!/bin/bash
# That is the "shebang" (also called hashbang or sha-bang).
#
# Syntax:  #!<path-to-interpreter>
#
# How it works:
#   1. The kernel sees the #! magic bytes at the start of the file.
#   2. It reads the interpreter path that follows.
#   3. It launches that interpreter and passes the script file to it.
#
# Without a shebang, the OS does not know which interpreter to use.
# The script may still run if you call it explicitly as:
#   bash script.sh
# But with a shebang you can run it directly:
#   ./script.sh

# --- Common Shebang Lines ---
#
#   #!/bin/bash          -> use bash explicitly
#   #!/bin/sh            -> use the system's POSIX shell (portable)
#   #!/usr/bin/env bash  -> locate bash via PATH (more portable across systems)
#   #!/usr/bin/env python3
#   #!/usr/bin/env node

# --- Demo ---
echo "Current shell in use : $SHELL"
echo "Bash version         : $BASH_VERSION"
