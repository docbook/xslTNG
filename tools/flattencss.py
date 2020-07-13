#!/usr/bin/env python3

"""Cheap and cheerful CSS flattener for AntennaHouse.

Replaces var(--name) with the variable declaration.
"""

import sys
import re
import click

@click.command()
@click.option('-t', '--title', required=True)
@click.option('-v', '--version', required=True)
@click.option('-s', '--source', required=True, multiple=True)
@click.option('-o', '--output', required=True)
def command(title, version, source, output):
    variables = {}
    vdecl = re.compile(r"^\s*--(.*):\s+(.*);")
    vref = re.compile(r"^(.*)var\(--([^\)]+)\)(.*)$")

    with open(output, "w") as printcss:
        printcss.write("/* Automatically generated, do not edit. */\n\n")

        for css in source:
            with open(css, 'r') as cssfile:
                for line in cssfile:
                    line = line.rstrip("\n")
                    line = line.replace("@@TITLE@@", title)
                    line = line.replace("@@VERSION@@", version)
                    groups = vdecl.search(line)
                    if groups:
                        variables[groups.group(1)] = groups.group(2)
                    else:
                        groups = vref.search(line)
                        while groups:
                            prefix = groups.group(1)
                            varname = groups.group(2)
                            suffix = groups.group(3)
                            if varname in variables:
                                line = prefix + variables[varname] + suffix
                            else:
                                print("Ignoring unknown variable:",
                                      varname, file=sys.stderr)
                                line = prefix + suffix
                            groups = vref.search(line)
                        printcss.write(line)
                        printcss.write("\n")


if __name__ == "__main__":
    command()
