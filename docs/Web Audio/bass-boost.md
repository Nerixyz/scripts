# Bass Boost

This script bass boosts the playing audio/video. It's a highshelf filter that lowers frequencies greater than `opts.FREQUENCY` by `opts.SIDECHAIN_LEVEL` and a gain filter that boosts all frequencies by `opts.POST_GAIN`.

See [category documentation](README.md) for more info.

```js linenums="1" title="webaudio/bass-boost.js"
--8<-- "webaudio/bass-boost.js"
```

[Source][source]

[source]: https://github.com/Nerixyz/scripts/blob/main/scripts/webaudio/bass-boost.js
