(() => {
  const opts = { FINAL_SPEED: 0.5 };
  function mapping(time) {
    return (1 - time) * (1 - opts.FINAL_SPEED) + opts.FINAL_SPEED;
  }
  const makeHandler =
    (fn) =>
    ({ target }) => {
      target.playbackRate = fn(target.currentTime / target.duration || 0);
    };
  globalThis.__opts = opts;
  globalThis.__handler = makeHandler(mapping);
  const vid =
    document.querySelector("video") ?? document.querySelector("audio");
  vid.addEventListener("timeupdate", globalThis.__handler);
  vid.preservesPitch = false;
})();
