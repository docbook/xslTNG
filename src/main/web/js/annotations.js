/* @@TITLE@@ version @@VERSION@@
 *
 * This is annotations.js providing support for popup annotations.
 *
 * See https://xsltng.docbook.org/
 *
 */

(function() {
  const showAnnotation = function(event, id) {
    let div = document.querySelector(id);
    div.style.display = "block";

    event.preventDefault();

    // Give the current click event a chance to settle?
    window.setTimeout(function () {
      let curpress = document.onkeyup;
      document.onkeyup = function (event) {
        hideAnnotation(event, id, curpress);
      };
    }, 25);

    return false;
  };

  const hideAnnotation = function(event, id, curpress) {
    let div = document.querySelector(id);
    div.style.display = "none";

    if (curpress) {
      document.onkeyup = curpress;
    }

    return true;
  };

  // The annotation close markup is hidden in a script. This prevents
  // it from showing up spuriously all over screen readers and other
  // user agents that don't support JavaScript. Find it and copy it
  // into the annotations.
  let annoClose = document.querySelector("script.annotation-closex");
  if (!annoClose) {
    // I have a bad feeling about this...
    annoClose = document.createElement("span");
    annoClose.innerHTML = "╳";
  }
  document.querySelectorAll("div.annotation-close").forEach(function(div) {
    div.innerHTML = annoClose.innerHTML;
  });

  document.querySelectorAll("a.annomark").forEach(function(mark) {
    let id = mark.getAttribute("href");
    // Escape characters that confuse querySelector
    id = id.replaceAll(".", "\\.");
    mark.onclick = function (event) {
      showAnnotation(event, id);
    };
  });

  document.querySelectorAll(".annotation-wrapper").forEach(function(anno) {
    let id = anno.getAttribute("id");
    if (id) {
      // Escape characters that confuse querySelector
      id = id.replaceAll(".", "\\.");
      anno.onclick = function (event) {
        hideAnnotation(event, `#${id}`);
      };
    }
  });
})();
