/* DocBook xslTNG version 2.0.11-SNAPSHOT
 *
 * This is report.js.
 *
 * See https://xsltng.docbook.org/
 *
 */

(function() {
  const toggleRows = function(kind) {
    const id = "#show" + kind;
    const button = document.querySelector(id);
    document.querySelectorAll(`tr.${kind}`).forEach(function (row) {
      if (button.checked) {
        row.style.display = "table-row";
      } else {
        row.style.display = "none";
      }
    });
  };

  // Portions adapted from https://stackoverflow.com/questions/14267781

  const cellContent = function(tr, idx) {
    return tr.children[idx].innerText || tr.children[idx].textContent;
  };

  const scenarioCellComparitor = function(a, b) {
    return Number(a.substring(8)) > Number(b.substring(8));
  };

  const cellComparitor = function(a, b) {
    return a.toString().localeCompare(b);
  };

  const rowComparitor = function(idx, asc) {
    return function (a, b) {
      // Hack to deal with column 0
      const cella = cellContent(asc ? a : b, idx);
      const cellb = cellContent(asc ? b : a, idx);
      if (idx == 0) {
        return scenarioCellComparitor(cella, cellb);
      } else {
        return cellComparitor(cella, cellb);
      }
    };
  };

  // n.b. There's only one table and it has thead/tbody!
  const table = document.querySelector("table");
  const tbody = table.querySelector("tbody");

  // The first column is initially sorted in ascending order
  const sortAscending = [ false, true, true, true ];
  const sortByRow = function(th) {
    table.querySelectorAll("th").forEach(function (cell) {
      cell.querySelector("span").innerHTML = "";
    });

    let column = Array.prototype.slice.call(th.parentNode.children).indexOf(th);
    let asc = sortAscending[column];

    if (asc) {
      th.querySelector("span").innerHTML = "↑";
    } else {
      th.querySelector("span").innerHTML = "↓";
    }

    Array.prototype.slice.call(tbody.querySelectorAll('tr'))
      .sort(rowComparitor(column, asc))
      .forEach(function(tr) {
        tbody.appendChild(tr);
      });
    sortAscending[column] = !sortAscending[column];
  };

  const div = document.querySelector("#hideresults");
  if (div) {
    var html = "<input type='checkbox' id='showpass' />";
    html += " Show passing tests. ";
    html += "<input type='checkbox' id='showfail' />";
    html += " Show failing tests. ";
    div.innerHTML = html;

    let box = document.querySelector("#showpass");
    box.checked = true;
    box.onclick = function (event) {
      toggleRows('pass');
      return true;
    };

    box = document.querySelector("#showfail");
    box.checked = true;
    box.onclick = function (event) {
      toggleRows('fail');
      return true;
    };
  }

  table.querySelectorAll("th").forEach(function(cell) {
    cell.innerHTML += "<span></span>";
    cell.style.cursor = "pointer";
    cell.onclick = function(event) {
      sortByRow(cell);
    };
  });
})();
