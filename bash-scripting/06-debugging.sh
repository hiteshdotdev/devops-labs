#!/bin/bash

# =============================================================
# TOPIC: Debugging Mode in Bash
# =============================================================

# --- Debugging Flags ---
#
# set -x   (xtrace)  Print each command before executing it.
#                    Prefixed with '+' in output.
#
# set -e   (errexit) Exit immediately if any command returns
#                    a non-zero exit code.
#
# set -u   (nounset) Treat unset variables as an error.
#
# set -o pipefail    A pipeline fails if ANY command in it fails
#                    (not just the last one).
#
# set -v   (verbose) Print each line of the script as it is read
#                    (before variable expansion).
#
# Combine them:  set -euxo pipefail   (common "strict mode")

# --- Enabling debug via shebang ---
# You can bake -x into the shebang line:
#   #!/bin/bash -x
# This turns on xtrace for the entire script.

# --- Enabling debug from the command line ---
# No file changes needed:
#   bash -x 06-debugging.sh
#   bash -v 06-debugging.sh

# ============================================================
# DEMO 1: set -x (xtrace) — watch every command expand & run
# ============================================================
echo "--- DEMO 1: xtrace ---"
set -x          # turn xtrace ON

greeting="Hello"
name="Hitesh"
echo "$greeting, $name!"
result=$(( 10 + 5 ))
echo "10 + 5 = $result"

set +x          # turn xtrace OFF
echo "(xtrace is now off)"

# ============================================================
# DEMO 2: set -u — catch typos in variable names
# ============================================================
echo ""
echo "--- DEMO 2: nounset (-u) ---"
set -u

defined_var="I exist"
echo "Defined var: $defined_var"

# Uncommenting the next line would cause the script to exit with:
#   bash: undefined_var: unbound variable
# echo "Undefined: $undefined_var"

set +u

# ============================================================
# DEMO 3: set -e — exit on first error
# ============================================================
echo ""
echo "--- DEMO 3: errexit (-e) ---"
set -e

echo "Step 1: OK"
echo "Step 2: OK"
# A failed command here would abort the script immediately.
# false    # uncomment to see -e in action

set +e   # disable errexit so the rest of the script keeps running

# ============================================================
# DEMO 4: checking exit codes manually
# ============================================================
echo ""
echo "--- DEMO 4: exit codes ---"

# Every command returns an exit code stored in $?
#   0   = success
#   1   = general error
#   2   = misuse of shell built-in
#   127 = command not found
#   130 = terminated by Ctrl+C

ls /tmp > /dev/null 2>&1
echo "ls /tmp exit code  : $?"    # 0  (success)

ls /nonexistent_path_xyz > /dev/null 2>&1
echo "ls <missing> code  : $?"    # non-zero (failure)

# ============================================================
# DEMO 5: the trap command — cleanup on exit or error
# ============================================================
echo ""
echo "--- DEMO 5: trap ---"

cleanup() {
    echo "  [trap] cleanup called — removing temp files, etc."
}

# trap <function> <signal>
# EXIT  -> always runs when the script exits (normal or error)
# ERR   -> runs whenever a command fails
# INT   -> runs on Ctrl+C (SIGINT)
trap cleanup EXIT

tmpfile=$(mktemp)
echo "Created temp file: $tmpfile"
echo "  (cleanup will delete it via trap on EXIT)"
rm -f "$tmpfile"

echo ""
echo "Script finished. Trap will fire now."
