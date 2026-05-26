# Day 4 - Pipes, Redirection, Grep, Awk, Sed

## Topics Covered
- Linux streams — stdin (0), stdout (1), stderr (2)
- Redirection — >, >>, 2>, 2>&1, /dev/null
- Pipes (|) — chaining commands, data flows between them simultaneously
- sort, uniq, uniq -c, wc, cut, tr — helper commands for pipes
- grep — pattern search with -i, -v, -n, -c, -r, -E, -A, -B, -C flags
- awk — column based processing, custom delimiters, conditional filtering
- sed — find/replace, delete lines, print specific lines, in-place editing
- Combining all of them into powerful one-liner pipe chains

## Files
- server.log — practice server log file used for all exercises
- errors.txt — grep output of only error lines
- commands.txt — complete command reference for today

## Key Takeaways
- Pipes turn simple commands into powerful data processing pipelines
- Always test sed without -i first before modifying actual files
- sort before uniq otherwise duplicates won't be detected
- 2>&1 must come AFTER > otherwise order of redirection is wrong
- /dev/null is used in every cron job and production script to suppress output
- grep -c is more concise than grep | wc -l for counting matches
