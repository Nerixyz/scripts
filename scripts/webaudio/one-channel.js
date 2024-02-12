(() => {
  const v = document.querySelector("video") ?? document.querySelector("audio");
  const ctx = new AudioContext();
  const splitter = ctx.createChannelSplitter(2);
  const merger = ctx.createChannelMerger(2);
  const src = ctx.createMediaElementSource(v);
  src.connect(splitter);
  splitter.connect(merger, 1, 0);
  splitter.connect(merger, 1, 1);
  merger.connect(ctx.destination);
})();
