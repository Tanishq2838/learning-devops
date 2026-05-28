# Day 6 - Functions, Error Handling, Complete Scripts

## Topics Covered
- Functions — defining, calling, passing arguments
- Function return values — echo/capture for data, return for exit codes
- Local variables — keeping variables safely inside functions
- set -e — exit immediately on any command failure
- set -u — error on undefined variables
- set -o pipefail — catch errors inside pipe chains
- trap — run cleanup or error handler automatically on exit or error
- Manual error checking — $?, ||, &&
- tee — write to screen and file simultaneously
- Logging function pattern — timestamped logs saved to file
- Professional script structure — config, helpers, tasks, main()

## Scripts Built Today
- functions_practice.sh — basic functions, arguments, return values
- function_exercises.sh — print_header, command_exists, get_file_size, count_lines
- error_handling.sh — demonstrates set -e stopping script on failure
- trap_demo.sh — cleanup and error handler with trap
- manual_errors.sh — $?, ||, && error handling patterns
- logging_demo.sh — tee based logging function
- system_health.sh — complete professional script combining everything

## Key Takeaways
- Always use local for variables inside functions
- Always put set -e and set -o pipefail at top of every script
- trap EXIT for cleanup, trap ERR for error handling
- || runs if left side fails, && runs if left side succeeds
- tee -a writes to screen and appends to file simultaneously
- > filename empties a file without deleting it
- Professional scripts have config at top, functions in middle, main() at bottom
- $LINENO tells you which line an error occurred on
- $$ gives the script's PID — useful for unique temp filenames
