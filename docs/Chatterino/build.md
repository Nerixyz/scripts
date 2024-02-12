---
icon: octicons/tools-16
---

# Release Build

Building [Chatterino](https://chatterino.com) isn't always straight forward.
To build it for my system in my desired configuration, I created a small script, that should run inside the cloned repository.
It builds from the current branch but makes sure it's up-to-date.

- [Conan2](https://conan.io/) is used for managing dependencies.
- Plugins are enabled
- LTO is enabled
- Crashpad is enabled
- Debug info is generated (and installed)

Qt is assumed to be installed by the Qt Maintenance Tool (`msvc2019_64` is expected in the Qt directory).

The following parameters can be specified:

- `-QtVersion <version>` Specifies the version of Qt to use (default: 6.5.0)
- `-QtPath <path>` Specifies the path to Qt (default: G:\Qt)
- `-InstallDir <dir>` Specifies the directory to install the build in (default: D:\Chatterino7)
- `-NoInstall` If specified, skips the installation/deployment

```pwsh linenums="1" title="chatterino/build.ps1"
--8<-- "chatterino/build.ps1"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/chatterino/build.ps1
