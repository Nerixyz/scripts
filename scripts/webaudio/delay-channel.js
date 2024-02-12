(() => {
  const opts = {
    DELAY: 1,
  };

  const ctx = new AudioContext();
  const audio =
    document.querySelector("video") ?? document.querySelector("audio");
  const src = ctx.createMediaElementSource(audio);
  const splitter = ctx.createChannelSplitter(2);
  const merger = ctx.createChannelMerger(2);
  const delay = ctx.createDelay(opts.DELAY);

  delay.delayTime.setValueAtTime(opts.DELAY, ctx.currentTime);

  src.connect(splitter);
  splitter.connect(delay, 0);

  delay.connect(merger, 0, 0);
  splitter.connect(merger, 1, 1);

  merger.connect(ctx.destination);
})();
