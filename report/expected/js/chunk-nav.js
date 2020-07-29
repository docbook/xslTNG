/* DocBook xslTNG version 1.2.0a1
 *
 * This is chunk-nav.js providing support for keyboard
 * navigation between chunks.
 *
 * See https://xsltng.docbook.org/
 *
 * There are a few things going on here.
 *
 * 1. The stylesheets store next/prev/up/home links in the HTML head
 *    using link/@rel elements.
 * 2. If chunk-nav.js is loaded, N/→, P/←, U/↑, and H/Home navigate to
 *    the next, previous, "up", and home pages.
 * 3. If the HTML pages contain a meta element with the name
 *    "localStorage.key", the value of that element is used as a key
 *    in the browser's localStorage API to track the Window location.
 * 4. The S key can be used to switch between a normal view and a
 *    speaker notes view. This requires a stylesheet customization
 *    that renders the speaker notes view.
 */

(function() {
  const KEY_N = 78;
  const KEY_RIGHT = 39;

  const KEY_P = 80;
  const KEY_LEFT = 37;

  const KEY_U = 85;
  const KEY_UP = 38;

  const KEY_H = 72;
  const KEY_HOME = 36;

  const KEY_S = 83;

  const meta = document.querySelector("head meta[name='localStorage.key']");
  const localStorageKey = meta && meta.getAttribute("content");
  const notesKey = "viewingNotes";
  let notesView = false;

  const nav = function(event) {
    event = event || window.event;
    let keyCode = event.keyCode || event.which;

    if (keyCode === KEY_N || keyCode === KEY_RIGHT) {
      return nav_to(event, "next");
    }

    if (keyCode === KEY_P || keyCode === KEY_LEFT) {
      return nav_to(event, "prev");
    }

    if (keyCode === KEY_U || keyCode === KEY_UP) {
      return nav_to(event, "up");
    }

    if (keyCode === KEY_H || keyCode == KEY_HOME) {
      return nav_to(event, "home");
    }

    if (localStorageKey && keyCode === KEY_S) {
      viewNotes(!notesView);
      return false;
    }

    return true;
  };

  const nav_to = function(event, rel) {
    event.preventDefault();
    let link = document.querySelector(`head link[rel='${rel}']`);
    if (link && link.hasAttribute("href")) {
      window.location.href = link.getAttribute("href");
    }
    return false;
  };

  const viewNotes = function(view) {
    if (view) {
      document.querySelectorAll("main > .foil > .foil").forEach(function(div) {
        div.style.display = "none";
      });
      document.querySelectorAll(".speaker-notes").forEach(function(div) {
        div.style.display = "block";
      });
    } else {
      document.querySelectorAll("main > .foil > .foil").forEach(function(div) {
        div.style.display = "block";
      });
      document.querySelectorAll(".speaker-notes").forEach(function(div) {
        div.style.display = "none";
      });
    }
    notesView = view;
    window.sessionStorage.setItem(notesKey, notesView);
  };

  const storageChange = function(changes, areaName) {
    if (changes.key === localStorageKey) {
      if (changes.newValue !== window.location) {
        window.location.href = changes.newValue;
      }
    }
  };

  if (localStorageKey) {
    if (!window.localStorage.getItem(localStorageKey)
        || window.localStorage.getItem(localStorageKey) !== window.location) {
      window.localStorage.setItem(localStorageKey, window.location);
    }
    window.addEventListener("storage", storageChange);

    if (window.sessionStorage.getItem(notesKey) !== null) {
      viewNotes(window.sessionStorage.getItem(notesKey) === "true");
    }
  }

  window.onkeyup = nav;
})();
