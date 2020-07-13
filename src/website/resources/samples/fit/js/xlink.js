/* DocBook xslTNG version 0.1.14
 *
 * This is xlink.js providing support for multi-targeted links
 *
 * See https://xsltng.docbook.org/
 *
 */

(function() {
  const CLOSED = "▶";
  const OPEN = "▼";

  const showXLinks = function(event, span, qsel) {
    span.innerHTML = OPEN;
    const top = span.offsetTop + span.offsetHeight;
    const left = span.offsetLeft;

    let links = document.querySelector(qsel);
    window.setTimeout(function () {
      const width = window.innerWidth
            || document.documentElement.clientWidth
            || document.body.clientWidth;
      checkPosition(links, top, left, width);
    }, 25);

    // Give the current click event a chance to settle?
    window.setTimeout(function () {
      let curclick = document.onclick;
      let curpress = document.onkeyup;
      document.onclick = function (event) {
        unshowXLinks(event, span, qsel, curclick, curpress);
      };
      document.onkeyup = function (event) {
        unshowXLinks(event, span, qsel, curclick, curpress);
      };
    }, 25);

    links.style.display = "inline-block";
    links.style.position = "absolute";
    links.style.top = top;
    links.style.left = left;
  };

  const unshowXLinks = function(event, span, qsel, curclick, curpress) {
    span.innerHTML = CLOSED;
    span.onclick = function (event) {
      showXLinks(event, span, qsel);
    };

    let links = document.querySelector(qsel);
    links.style.display = "none";

    document.onclick = curclick;
    document.onkeyup = curpress;
  };

  const checkPosition = function(links, top, left, width) {
    if (left + links.offsetWidth + 10 >= width) {
      const newx =  left - 20;
      if (newx >= 0) {
        links.style.left = newx;
        links.style.top = top;
        if (newx == left) {
          console.log("Looping!");
        } else {
          window.setTimeout(function () {
            checkPosition(links, top, newx, width);
          }, 15);
        }
      }
    }
  };

  // Process XLink multi-targeted links
  document.querySelectorAll(".xlink-arc-list").forEach(function(span) {
    span.innerHTML = CLOSED;
    span.classList.add("js");
    span.onclick = function (event) {
      showXLinks(event, span, "#" + span.getAttribute("db-arcs"));
    };
  });

  document.querySelectorAll(".nhrefs").forEach(function(span) {
    span.classList.add("js");
  });
})();
