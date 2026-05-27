# Day 5 - Bash Scripting: Variables, Conditionals, Loops

## Topics Covered
- Variables — defining, accessing, readonly, unset
- Command substitution — storing command output in variables
- Special variables — $0, $1, $#, $@, $?, $$, $USER, $HOME
- User input — read, silent input, timeout, default values
- Conditionals — if/elif/else with file, string, and number checks
- For loops — list, range, step, files, command output
- While loops — condition based, infinite loop with break
- Until loops — opposite of while
- Loop control — break and continue
- Arithmetic — double brackets, increment, decrement, modulo
- set -e and set -u for safer scripts

## Scripts Built Today
- special_vars.sh — demonstrates all special variables
- fileChecker.sh — checks if file exists, is directory, prints stats
- number_check.sh — takes user input and compares to 100
- log_summary.sh — full script combining variables, loops, conditionals

## Key Takeaways
- No spaces around = when defining variables
- Always use $1 inside quotes "$1" to handle empty arguments safely
- exit 1 when something goes wrong, exit 0 on success
- $? checks if last command succeeded (0) or failed (non-zero)
- Arithmetic always needs double brackets (( ))
- set -e at top of every script so it stops on first error
- Always check arguments and file existence before using them
