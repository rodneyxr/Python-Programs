#!/usr/bin/python3
"""
prob1.py: Write Parser for More Complex Language
"""

import sys

nxt = None
src = ""


def p():
    global src
    scan()
    if nxt == '$':
        sys.exit(0)  # exit with just '$'
    e()
    if nxt == '$':
        sys.stdout.write("ACCEPT, ")
        sys.stdout.write("SOURCE:" + src + "\n")
        src = ""
    else:
        error(1)


def e():
    t()
    while nxt == '+' or nxt == '-':
        scan()
        t()


def t():
    s()
    while nxt == '*' or nxt == '/':
        scan()
        s()


def s():
    f()
    if nxt == '^':
        scan()
        s()


def f():
    while nxt == '+' or nxt == '-':
        scan()
    if nxt.isalnum():  # alphanum
        scan()
    elif nxt == '(':
        scan()
        e()
        if nxt == ')':
            scan()
        else:
            error(2)
    else:
        error(3)


def error(n):
    sys.stdout.write("ERROR:" + str(n))
    sys.stdout.write(", SOURCE:" + src + "\n")
    sys.exit(1)


def getch():
    c = sys.stdin.read(1)
    if len(c) > 0:
        return c
    else:
        return None


def scan():
    global nxt
    global src
    nxt = getch()
    if nxt is None:
        sys.exit(1)
    while nxt.isspace():  # skip whitesp
        nxt = getch()
    src += nxt


while True:
    p()
