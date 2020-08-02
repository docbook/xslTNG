/* @@TITLE@@ version @@VERSION@@
 *
 * This is persistent-toc.js providing support for the ToC popup
 *
 * See https://xsltng.docbook.org/
 *
 */

(function() {
  const ESC = 27;
  const SPACE = 32;
  const toc = document.querySelector("nav.toc");
  let navPersist = false;
  let borderLeftColor = "white";

  const showToC = function(event) {
    toc.style.width = "300px";
    toc.style["padding-left"] = "1em";
    toc.style["padding-right"] = "1em";
    toc.style["border-left"] = `1px solid ${borderLeftColor}`;

    navPersist = event && event.shiftKey;

    if (event) {
      event.preventDefault();
    }

    // Give the current click event a chance to settle?
    window.setTimeout(function () {
      const tocClose = toc.querySelector("header .close");
      const curpress = document.onkeyup;
      tocClose.onclick = function (event) {
        hideToC(event, curpress);
      };
      document.onkeyup = function (event) {
        event = event || window.event;
        let charCode = event.keyCode || event.which;
        if (charCode == SPACE || charCode == ESC) {
          hideToC(event, curpress);
        }
      };

      let url = window.location.href;
      let hash = "";
      let pos = url.indexOf("#");
      if (pos > 0) {
        hash = url.substring(pos);
        url = url.substring(0,pos);
      }
      
      pos = url.indexOf("?");
      if (pos >= 0) {
        navPersist = true;
        url = url.substring(0, pos);
      }
      url = url + hash;

      // Remove ?toc from the URI so that if it's bookmarked,
      // the ToC reference isn't part of the bookmark.
      window.history.replaceState({}, document.title, url);

      pos = url.lastIndexOf("/");
      url = url.substring(pos+1);
      let target = document.querySelector("nav.toc div a[href='"+url+"']");
      if (target) {
        target.scrollIntoView();
      } else {
        console.log("No target:" + url);
      }
    }, 400);

    return false;
  };

  const hideToC = function(event, curpress) {
    document.onkeyup = curpress;
    toc.classList.add("slide");
    toc.style.width = "0px";
    toc.style["padding-left"] = "0";
    toc.style["padding-right"] = "0";
    toc.style["border-left"] = "none";
    event.preventDefault();
    return false;
  };

  const patchLink = function(event, anchor) {
    if (!navPersist) {
      return false;
    }

    let href = anchor.getAttribute("href");
    let pos = href.indexOf("#");
    if (pos >= 0) {
      href = href.substring(0, pos) + "?toc" + href.substring(pos);
    } else {
      href = href + "?toc";
    }

    event.preventDefault();
    window.location.href = href;
    return false;
  };

  // Setting the border-left-style in CSS will put a thin border-colored
  // stripe down the right hand side of the window. Here we get the color
  // of that stripe and then remove it. We'll put it back when we
  // expand the ToC.
  borderLeftColor = window.getComputedStyle(toc)["border-left-color"];
  toc.style["border-left"] = "none";

  const tocOpenScript = document.querySelector("script.tocopen");
  const tocOpen = document.querySelector("nav.tocopen");
  tocOpen.innerHTML = tocOpenScript.innerHTML;
  tocOpen.onclick = showToC;

  const tocScript = document.querySelector("script.toc");
  toc.innerHTML = tocScript.innerHTML;

  if (!document.querySelector("body.home")) {
    tocOpen.style.display = "inline";
  }

  document.querySelectorAll("nav.toc div a").forEach(function (anchor) {
    anchor.onclick = function(event) {
      patchLink(event, anchor);
    };
  });

  let tocJump = false;
  let pos = window.location.href.indexOf("?");
  if (pos >= 0) { // How could it be zero?
    let query = window.location.href.substring(pos+1);
    pos = query.indexOf("#");
    if (pos >= 0) {
      query = query.substring(0, pos);
    }
    query.split("&").forEach(function(item) {
      tocJump = tocJump || (item === "toc" || item === "toc=1" || item === "toc=true");
    });
  }

  if (tocJump) {
    showToC(null);
  } else {
    // If we're not going to jump immediately to the ToC,
    // add the slide class for aesthetics if the user clicks
    // on it.
    toc.classList.add("slide");
  }
})();
