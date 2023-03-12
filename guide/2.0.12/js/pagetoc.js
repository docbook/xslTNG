/* DocBook xslTNG version 2.0.12
 *
 * This is pagetoc.js providing support for on-page ToCs.
 *
 * See https://xsltng.docbook.org/
 *
 */

(function() {
  const DECORATED = 0;
  const PLAIN = 1;
  const HIDDEN = 2;

  const html = document.querySelector("html");
  const main = document.querySelector("main");
  const pagetoc = document.querySelector("nav.pagetoc div.tocwrapper");

  let dynamic = true;
  html.querySelectorAll("head script").forEach(script => {
    const data = script.getAttribute("data-dynamic-pagetoc");
    if (data) {
      console.log("DATA:" + data);
      dynamic = (data == "true");
    }
  });

  let tocstate = dynamic ? DECORATED : PLAIN;
  let tocclass = "active";
  let toclength = 0;

  const findsections = function(parent) {
    const sections = [];
    let firstparent = null;
    parent.querySelectorAll("section").forEach(sect => {
      const id = sect.getAttribute("id");
      const header = sect.querySelector("header");
      const title = header && header.querySelector("h1,h2,h3,h4,h5,h6");
      const skip = sect.classList.contains("nopagetoc");
      if (id && title && !skip) {
        toclength++;

        // Don't find nested sections...
        if (!firstparent) {
          firstparent = sect.parentNode;
        }

        if (sect.parentNode == firstparent) {
          sections.push({
            "elem": sect,
            "id": id,
            "title": title.innerHTML
          });
        }
      }
    });

    return sections;
  };

  const maketoc = function(sections, depth) {
    if (depth == 0) {
      if (dynamic) {
        const ctrl = document.createElement("div");
        ctrl.setAttribute("class", "ctrl");
        const btn = document.createElement("span");
        btn.setAttribute("class", "toggle");
        btn.innerHTML = window.DocBook.pagetoc.decorated;
        ctrl.appendChild(btn);
        ctrl.addEventListener("click", event => {
          switch (tocstate) {
          case DECORATED:
            tocstate = PLAIN;
            btn.innerHTML = window.DocBook.pagetoc.plain;
            pagetoc.querySelectorAll(".li.active").forEach(li => {
              li.classList["remove"]('active');
              li.classList["add"]('plain');
            });
            tocclass = 'plain';
            break;
          case PLAIN:
            tocstate = HIDDEN;
            btn.innerHTML = window.DocBook.pagetoc.hidden;
            pagetoc.style.display = "none";
            break;
          case HIDDEN:
            tocstate = DECORATED;
            btn.innerHTML = window.DocBook.pagetoc.decorated;
            pagetoc.style.display = "block";
            pagetoc.querySelectorAll(".li.plain").forEach(li => {
              li.classList["remove"]('plain');
              li.classList["add"]('active');
            });
            tocclass = 'active';
            break;
          }
        });
        pagetoc.parentNode.insertBefore(ctrl, pagetoc);
      }
      const header = main.querySelector("header");
      const title = header && header.querySelector("h1,h2,h3,h4,h5,h6");
      if (title) {
        const div = document.createElement("div");
        div.setAttribute("class", "li depth" + depth);
        const anchor = document.createElement("a");
        anchor.setAttribute("href", "#");
        anchor.innerHTML = title.innerHTML;
        div.appendChild(anchor);
        pagetoc.appendChild(div);
      }
    }

    sections.forEach(section => {
      const subsections = findsections(section.elem);
      const div = document.createElement("div");
      div.setAttribute("class", "li depth"+depth);
      const anchor = document.createElement("a");
      anchor.setAttribute("href", "#" + section.id);
      anchor.innerHTML = section.title;
      div.appendChild(anchor);
      pagetoc.appendChild(div);
      if (subsections) {
        maketoc(subsections, depth+1);
      }
    });
  };

  if (main && pagetoc) {
    if (!window.DocBook) {
      window.DocBook = {};
    }
    if (!window.DocBook.pagetoc) {
      window.DocBook.pagetoc = {};
    }
    if (!window.DocBook.pagetoc.decorated) {
      window.DocBook.pagetoc.decorated = "☀";
    }
    if (!window.DocBook.pagetoc.plain) {
      window.DocBook.pagetoc.plain = "￮";
    }
    if (!window.DocBook.pagetoc.hidden) {
      window.DocBook.pagetoc.hidden = "◄";
    }

    const sections = findsections(main);
    if (toclength > 1) {
      maketoc(sections, 0);

      if (dynamic) {
        const observer = new IntersectionObserver((sections) => {
          sections.forEach((section) => {
            const id = section.target.getAttribute("id");
            const header = section.target.querySelector("header");
            const title = header && header.querySelector("h1,h2,h3,h4,h5,h6");
            if (!id || !title) {
              return;
            }

            // Get the link to this section's heading
            const link = pagetoc.querySelector(`nav.pagetoc .li a[href="#${id}"]`);
            if (!link) {
              return;
            }

            // Add/remove the .active class based on whether the
            // section is visible
            const addRemove = section.intersectionRatio > 0 ? 'add' : 'remove';
            link.parentNode.classList[addRemove](tocclass);
          });
        });

        // Observe all the sections of the article
        main.querySelectorAll('section').forEach((section) => {
          observer.observe(section);
        });
      }
    }
  }
})();
