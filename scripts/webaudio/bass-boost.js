(() => {
  const opts = {
    FREQUENCY: 70,
    SIDECHANNEL_LEVEL: -12,
    POST_GAIN: 2,
  };
  const ctx = new AudioContext();
  const audio =
    document.querySelector("video") ?? document.querySelector("audio");
  const src = ctx.createMediaElementSource(audio);
  const bi = ctx.createBiquadFilter();
  const gain = ctx.createGain();

  bi.type = "highshelf";
  bi.frequency.setValueAtTime(opts.FREQUENCY, ctx.currentTime);
  bi.gain.setValueAtTime(opts.SIDECHANNEL_LEVEL, ctx.currentTime);
  gain.gain.setValueAtTime(opts.POST_GAIN, ctx.currentTime);

  src.connect(bi);
  bi.connect(gain);
  gain.connect(ctx.destination);
})();
