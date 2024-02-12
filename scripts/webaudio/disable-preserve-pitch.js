(() => {
  const _ = document.querySelector("video") ?? document.querySelector("audio");
  _.mozPreservesPitch = _.preservesPitch = false;
})();
