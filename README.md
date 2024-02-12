# scripts

This repository/site contains some scripts or snippets I often use throughout different projects and/or machines.
The scripts can be found in [`scripts/`](scripts), scripts in `scripts/bin/{os}` should be added to _PATH_.

Feel free to add new scripts or adjust scripts to fit your setup (e.g. by adding parameters).

You can find the site at [nerixyz.de/scripts](https://nerixyz.de/scripts).

## Building

Please use a [virtual environment](https://docs.python.org/3/library/venv.html) (POSIX: `python3 -m venv venv` and `source venv/bin/activate`).

```shell
pip3 install -r requirements.txt
# Preview
mkdocs serve
# Build
mkdocs build
```

## Adding a new Script/Snippet

- Find or create a category (e.g. VS Code)
- Add your script/snippet to `scripts/`
  - If the script should be in PATH, add it to `scripts/bin/{os}`
- Add a new Markdown file
- Add your script/snippet using the `--8<--` snippet syntax ([docs](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/))
