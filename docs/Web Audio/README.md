# Web Audio

Scripts in this category are only for fun. They are meant to be pasted into the DevTools console.
Pasting multiple into one tab isn't supported (yet).

I originally had them in [a Gist](https://gist.github.com/Nerixyz/97e966abd1dcbeb6b4bc0318fb969c3e).

## Bass Boost

This script bass boosts the playing audio/video. It's a highshelf filter that lowers frequencies greater than `opts.FREQUENCY` by `opts.SIDECHAIN_LEVEL` and a gain filter that boosts all frequencies by `opts.POST_GAIN`.

See [category documentation](README.md) for more info.

```js linenums="1" title="webaudio/bass-boost.js"
--8<-- "webaudio/bass-boost.js"
```

[Source](https://github.com/Nerixyz/scripts/blob/main/scripts/webaudio/bass-boost.js)

## Delay Channel

This script delays the left (first) channel by `opts.DELAY` seconds.

See [category documentation](README.md) for more info.

```js linenums="1" title="webaudio/delay-channel.js"
--8<-- "webaudio/delay-channel.js"
```

[Source](https://github.com/Nerixyz/scripts/blob/main/scripts/webaudio/delay-channel.js)

## Preserve Pitch

This script disables the pitch preserving algorithm that's enabled by default in browsers, which tries to preserve the pitch when adjusting the speed of the audio/video.

See [category documentation](README.md) for more info.

```js linenums="1" title="webaudio/disable-preserve-pitch.js"
--8<-- "webaudio/disable-preserve-pitch.js"
```

[Source](https://github.com/Nerixyz/scripts/blob/main/scripts/webaudio/disable-preserve-pitch.js)

## One Channel

This script turns stereo audio into mono audio by routing the right (second) channel of the input to both the left and right channel of the output. You might want something like this if someone from the production team messed up the levels on the channels (e.g. only one channel has audio).

See [category documentation](README.md) for more info.

```js linenums="1" title="webaudio/one-channel.js"
--8<-- "webaudio/one-channel.js"
```

[Source](https://github.com/Nerixyz/scripts/blob/main/scripts/webaudio/one-channel.js)

## Turntable Losing Power

This script emulates the _Turntable Losing Power_ effect from Adobe Audition.

See [category documentation](README.md) for more info.

```js linenums="1" title="webaudio/turntable-losing-power.js"
--8<-- "webaudio/turntable-losing-power.js"
```

[Source](https://github.com/Nerixyz/scripts/blob/main/scripts/webaudio/turntable-losing-power.js)
