---
icon: octicons/beaker-16
---

# Launch CTest

To debug a specific test in the _Testing_ tab of VS Code, it needs a configuration in `launch.json` that supports running a specific test. Since I often can't find the documentation for it, I added the config here.
`"args": [ "${cmake.testArgs}" ]` really does the magic here. If you want to use GDB, replace `cppvsdbg` with `cppdbg`.

See also [Debugging Tests](https://github.com/microsoft/vscode-cmake-tools/blob/main/docs/debug-launch.md#debugging-tests) ([permalink](https://github.com/microsoft/vscode-cmake-tools/blob/0b46c294b6fa78edd7f8880e068543deea899b75/docs/debug-launch.md#debugging-tests)).

```json linenums="1" title="vscode/launch-ctest.json"
--8<-- "vscode/launch-ctest.json"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/vscode/launch-ctest.json
