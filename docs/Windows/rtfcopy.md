---
icon: material/content-copy
---

# Copy RTF Text

[Pygments](https://pygments.org/) provides a way of exporting RTF, but copying that and pasting it into Office apps doesn't work, as it will end up as regular text.

[`rtfcopy.ps1`][source] can copy the text as RTF and pasting that text into for example PowerPoint will result in colorized text.

Usage: `pygmentize -f rtf <file> | rtfcopy.ps1`.

```pwsh linenums="1" title="bin/windows/rtfcopy.ps1"
--8<-- "bin/windows/rtfcopy.ps1"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/bin/windows/rtfcopy.ps1
