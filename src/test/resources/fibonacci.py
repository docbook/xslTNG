#!/bin/env python

"""Computes the n'th Fibonacci number."""

import sys
import math
import click

SQRT5 = math.sqrt(5)


@click.command()
@click.argument("number", nargs=1,
                type=click.IntRange(1, None))
def fibonacci(number):
    """Calculate the 'number'th Fibonacci number."""
    prefix = f"The {make_ordinal(number)} Fibonacci number is "
    try:
        value = (((1 + SQRT5) / 2) ** number -
                 ((1 - SQRT5) / 2) ** number) / SQRT5
        print(f"{prefix}{math.floor(value):,}.")
    except OverflowError:
        print(f"{prefix}too large to calculate.")
        sys.exit(1)


def make_ordinal(n):
    """Create an ordinal from a number."""
    # https://stackoverflow.com/questions/9647202
    suffix = ["th", "st", "nd", "rd", "th"][min(n % 10, 4)]
    if 11 <= (n % 100) <= 13:
        suffix = "th"
    return str(n) + suffix


if __name__ == "__main__":
    fibonacci()
