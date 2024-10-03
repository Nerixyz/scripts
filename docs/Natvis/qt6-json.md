---
icon: material/bug-outline
---

# Qt6 JSON

Qt6 reuses types from `QtCbor` for the JSON types (`QJsonValue`, `QJsonObject`, `QJsonArray`, etc.). These types can't be referenced in NatVis expressions without naming the module (the dynamic library) they're located in. This makes the visualizers non-portable (e.g. the visulizers presented here only work for the debug versions of Qt).

The visualizers are based on [`QJson.natvis`](https://github.com/aleksey-nikolaev/natvis-collection/blob/bd39c080d1984cc331b231845e7755f31411f7fd/QJson.natvis) from Aleksey Nikolaev.

<!-- prettier-ignore -->
!!! warning

    These visualizers only work with VS Code's `cppvsdbg`. They don't work in Visual Studio right now. If you know how to fix this, feel free to open a PR.

```xml linenums="1" title="natvis/Qt6Json.natvis"
--8<-- "natvis/Qt6Json.natvis"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/natvis/Qt6Json.natvis
