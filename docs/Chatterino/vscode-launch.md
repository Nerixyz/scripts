---
icon: material/bug-play-outline
---

# Launch Debug Instance

This is a `launch.json` for VS Code on Windows to launch a debug instance of [Chatterino](https://chatterino.com) with appropriate logging, source-maps, and debug info for Qt.

Qt is expected to be installed at `G:\QT` in version `6.5.0`. The builds are expected to be the official ones. Cache files for debug info are placed in `D:\VSSymbolCache`. A cloned [qtbase](https://github.com/qt/qtbase/) (from the appropriate branch) is expected at `G:\Dev\qt-source`.

`qt6.natvis` can be obtained by running the following command in PowerShell inside the cloned repo:

```pwsh
(iwr "https://github.com/qt-labs/vstools/raw/dev/QtVsTools.Package/qt6.natvis.xml").Content.Replace('##NAMESPACE##::', '') | Out-File qt6.natvis
```

```json linenums="1" title="chatterino/launch-debug.json"
--8<-- "chatterino/launch-debug.json"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/chatterino/launch-debug.json
