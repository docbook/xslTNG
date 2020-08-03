#!/usr/bin/env python3

"""This tool extracts CSS definitions for Pygments highlighting."""

import sys
import click
from pygments.formatters import get_formatter_by_name

@click.command()
@click.option('-t', '--title', required=True)
@click.option('-v', '--version', required=True)
@click.option('-o', '--output', required=True)
def command(title, version, output):
    config = [{"theme": "",
               "prefix": ".highlight",
               "style": "default"},
              {"theme": "materials-dark",
               "prefix": ".materials-dark .highlight",
               "style": "stata-dark"},
              {"theme": "materials-light",
               "prefix": ".materials-light .highlight",
               "style": "stata-light"}]

    with open(output, "w") as printcss:
        print(f"/* {title} version {version}", file=printcss)
        print(" *", file=printcss)
        print(" * This is pygments.css. This file is generated with Pygments.", file=printcss)
        print(" *", file=printcss)
        print(" * See https://xsltng.docbook.org/", file=printcss)
        print(" *", file=printcss)
        print(" */", file=printcss)
        for theme in config:
            parsed_opts = {"style": theme["style"]}
            formatter = get_formatter_by_name("html", **parsed_opts)
            print(formatter.get_style_defs(theme["prefix"]), file=printcss)

if __name__ == "__main__":
    command()
