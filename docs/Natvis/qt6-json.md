---
icon: material/bug-outline
---

# Qt6 JSON

[Qt6Json.natvis][source] contains [NatVis](https://learn.microsoft.com/en-us/visualstudio/debugger/create-custom-views-of-native-objects) expressions for Qt 6's JSON types. In particular, the following types (excluding CBOR) are visualized:

- [`QJsonValue`](https://doc.qt.io/qt-6/qjsonvalue.html)
- [`QJsonObject`](https://doc.qt.io/qt-6/qjsonobject.html)
- [`QJsonArray`](https://doc.qt.io/qt-6/qjsonarray.html)
- [`QJsonDocument`](https://doc.qt.io/qt-6/qjsondocument.html)
- `QJsonValue(Const)Ref`

Iterators (possibly `const`) and `QJson{Array,Object}(Const)Ref` (potentially in 6.9) are automatically visualized as they wrap types with existing visualizers.

The visualizers are based on [`QJson.natvis`](https://github.com/aleksey-nikolaev/natvis-collection/blob/bd39c080d1984cc331b231845e7755f31411f7fd/QJson.natvis) from Aleksey Nikolaev. They were extended to support both UTF-16 and UTF-8 (+ASCII) strings. Additionally, there's basic support for CBOR types (`QCborValue` etc.).

To add the visualizers to Visual Studio, follow the [documentation](https://learn.microsoft.com/en-us/visualstudio/debugger/create-custom-views-of-native-objects#BKMK_natvis_location).
In VS Code, use [`visualizerFile`](https://code.visualstudio.com/docs/cpp/launch-json-reference#_visualizerfile). Note that [only one file is supported right now](https://github.com/microsoft/vscode-cpptools/issues/10917), so you might have to merge this with other visualizers.

!!! warning

    Make sure that symbols for QtCore are loaded (i.e. `Qt6Cored.pdb`), otherwise, the expression evaluator will fail to expand variables (error similar to: _Error while evaluating '(Qt6Cored.dll!QCborContainerPrivate\*)o.d' in the context of type 'something.exe!QJsonObject'_). When installing Qt through the online installer, make sure to select **Qt Debug Information Files**.

    In your debugger, add the `bin` directory of your Qt installation (e.g. `C:\Qt\6.8.0\msvc2022_64\bin`) to the symbol search path. For Visual Studio, this is located in Options > Debugging > Symbols. In VS Code, set [`symbolOptions.searchPaths`](https://code.visualstudio.com/docs/cpp/launch-json-reference#_symbol-options) in your launch-configuration.

The visualizers currently only support dynamically linked debug builds of Qt. To support release builds, replace `Qt6Cored.dll` with `Qt6Core.dll` in the NatVis file. In a statically linked build, it should be enough to remove `Qt6Cored.dll!` (I didn't test this yet).

If you see any bug or have additions, feel free to open issues and PRs in the repo at the top of this page.

??? note "natvis/Qt6Json.natvis"

    ```xml linenums="1"
    --8<-- "natvis/Qt6Json.natvis"
    ```

[View `Qt6Json.natvis` on GitHub][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/natvis/Qt6Json.natvis
