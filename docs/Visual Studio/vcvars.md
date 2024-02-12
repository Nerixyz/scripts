---
icon: octicons/terminal-16
---

# Set Environment in PowerShell

Visual Studio comes with the _Developer Command Prompt for VS 2022_, but doesn't provide a way of setting the environment variables in some existing shell.

[`vcvars.ps1`][source] does just that. After invoking it, it searches for a Visual Studio installation (order: [`vswhere`](https://github.com/microsoft/vswhere), [`Get-VSSetupInstance`](https://github.com/microsoft/vssetup.powershell), default community path) and sets the environment variables `vcvars64.bat` would set.

```pwsh linenums="1" title="bin/windows/vcvars.ps1"
--8<-- "bin/windows/vcvars.ps1"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/bin/windows/vcvars.ps1
