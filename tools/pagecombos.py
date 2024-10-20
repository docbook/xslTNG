#!/usr/bin/env python3

"""A tool to generate all the combinations of page styles for
a4, a5, or letter, portrait or landscape, article or book,
draft or not-draft.
"""

import sys
import re
import click

def combos(prefix, curstatus, seq):
    selectors = []
    for orient in [".portrait", ".landscape"]:
        for status in [".final", ".draft"]:
            if curstatus == ".draft" and status == ".final":
                continue
            newprefix = f"{prefix}{seq[0]}{orient}{status}"
            selectors.append(newprefix)
            if len(seq) > 1:
                selectors += combos(f"{newprefix} ", status, seq[1:])

    return selectors

def simplify(complex):
    selector = ""
    orient = ""
    status = ""
    parts = complex.split(" ")
    for part in parts:
        neworient = "landscape" if ".landscape" in part else "portrait"
        newstatus = "draft" if ".draft" in part else "final"
        if orient == neworient or (orient == "" and neworient == "portrait"):
            part = part.replace(f".{neworient}", "")
        if status == newstatus or (status == "" and newstatus == "final"):
            part = part.replace(f".{newstatus}", "")

        #if orient != neworient or status != newstatus:
        #    selector += part + " "
        selector += part + " "

        #print(f"{selector} :: {orient}={neworient}, {status}={newstatus}")

        orient = neworient
        status = newstatus

    return selector.strip()

def generate():
    selectors  = combos("", "", ["body", ".division", ".component", ".db-bfs", ".formalobject" ])
    selectors += combos("", "", ["body", ".division", ".component", ".section", ".formalobject" ])
    selectors += combos("", "", ["body", ".division", ".component", ".db-bfs", ".informalobject" ])
    selectors += combos("", "", ["body", ".division", ".component", ".section", ".informalobject" ])
    selectors += combos("", "", ["body", ".division", ".component", ".db-bfs", ".list-of-titles" ])
    selectors += combos("", "", ["body", ".division", ".component", ".section", ".list-of-titles" ])

    selectors += combos("", "", ["body", ".division", ".list-of-titles" ])
    selectors += combos("", "", ["body", ".list-of-titles" ])

    selectors += combos("", "", ["body", ".component", ".db-bfs", ".formalobject" ])
    selectors += combos("", "", ["body", ".component", ".section", ".formalobject" ])
    selectors += combos("", "", ["body", ".component", ".db-bfs", ".informalobject" ])
    selectors += combos("", "", ["body", ".component", ".section", ".informalobject" ])
    selectors += combos("", "", ["body", ".component", ".db-bfs", ".list-of-titles" ])
    selectors += combos("", "", ["body", ".component", ".section", ".list-of-titles" ])

    selectors += combos("", "", ["body", ".db-bfs", ".formalobject" ])
    selectors += combos("", "", ["body", ".section", ".formalobject" ])
    selectors += combos("", "", ["body", ".db-bfs", ".informalobject" ])
    selectors += combos("", "", ["body", ".section", ".informalobject" ])
    selectors += combos("", "", ["body", ".db-bfs", ".list-of-titles" ])
    selectors += combos("", "", ["body", ".section", ".list-of-titles" ])

    selectors += combos("", "", ["body", ".component", ".formalobject" ])
    selectors += combos("", "", ["body", ".component", ".informalobject" ])
    selectors += combos("", "", ["body", ".component", ".list-of-titles" ])

    selectors += combos("", "", ["body", ".formalobject" ])
    selectors += combos("", "", ["body", ".informalobject" ])
    selectors += combos("", "", ["body", ".list-of-titles" ])

    buckets = {
        "portrait": [],
        "landscape": [],
        "draft.portrait": [],
        "draft.landscape": []
    }

    seen = set()
    for selector in selectors:
        simple = simplify(selector)
        if simple in seen:
            continue
        seen.add(simple)

        if simple.rfind(".landscape") < 0 or simple.rfind(".portrait") > simple.rfind(".landscape"):
            orient = "portrait"
        else:
            orient = "landscape"

        if "draft" in simple:
            buckets[f"draft.{orient}"].append(simple)
        else:
            buckets[orient].append(simple)

    for style in ["article", "book"]:
        print("@each $pagesize in [A4, A5, Letter] {")
        selectors = buckets["portrait"]
        for index in range(0, len(selectors)):
            if index + 1 == len(selectors):
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]} {{")
            else:
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]},")

        print(f"        page: #{{$pagesize}}-{style}-flow-portrait;")
        print("    }")

        print("")
        selectors = buckets["landscape"]
        for index in range(0, len(selectors)):
            if index + 1 == len(selectors):
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]} {{")
            else:
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]},")

        print(f"        page: #{{$pagesize}}-{style}-flow-landscape;")
        print("    }")

        print("")
        selectors = buckets["draft.portrait"]
        for index in range(0, len(selectors)):
            if index + 1 == len(selectors):
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]} {{")
            else:
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]},")

        print(f"        page: #{{$pagesize}}-{style}-flow-portrait-draft;")
        print("    }")

        print("")
        selectors = buckets["draft.landscape"]
        for index in range(0, len(selectors)):
            if index + 1 == len(selectors):
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]} {{")
            else:
                print(f"    html.{style}-style.#{{$pagesize}} {selectors[index]},")

        print(f"        page: #{{$pagesize}}-{style}-flow-landscape-draft;")
        print("    }")

        print("}")



if __name__ == "__main__":
    generate()
