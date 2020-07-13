(function() {
  const fixed = document.querySelector(".fixed");
  const h1 = fixed.querySelector("h1");
  let width = fixed.parentNode.offsetWidth;
  let height = fixed.offsetHeight;
  let docheight = window.innerHeight;

  const h2 = document.querySelector("h2");

  const fixupWidth = function (event) {
    width = fixed.parentNode.offsetWidth;
    height = fixed.offsetHeight;
    docheight = window.innerHeight;
    fixed.style.width = `${width}px`;
    h2.style["padding-top"] = `${height}px`;
  };

  const storeScroll = function () {
    if (window.scrollY == 0) {
      fixed.classList.remove("scrolled");
    } else {
      fixed.classList.add("scrolled");
    }
    //fixed.dataset.scroll = window.scrollY;
  };

  window.onresize = fixupWidth;
  document.onscroll = storeScroll;

  fixed.style.width = `${width}px`;
  fixed.style.position = "fixed";
  h2.style["padding-top"] = `${height}px`;
})();
