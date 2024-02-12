---
icon: material/text-search-variant
---

# Capture Logs

Since capturing logs from a running instance on Windows might not always be easy, I made a tool that attaches to Chatterino and reads its logs. No relaunch is required.

The tool is open-source at [:octicons-mark-github-16: Nerixyz/c2-logs](https://github.com/nerixyz/c2-logs) ([:octicons-download-16: Releases](https://github.com/Nerixyz/c2-logs/releases)).

Usage: `c2-logs.exe [OPTIONS] [RULES]...`

Arguments:

- `[RULES]...`: Qt filter rules (e.g. \*.debug=true or foo.bar.debug=false). Multiple rules will be joined by a newline.

Options:

- `--exe <EXECUTABLE>`: Use this to specify the name of the Chatterino executable (default: chatterino.exe).
- `--pid <PID>`: Use this to specify a specific process-id to attach to.
- `-o <OUTPUT_FILE>`: Output to a file instead
