#!/usr/bin/python3
"""
prob2.py: Translate to RPN
After hours of trying to get problem 2 working I went online for help.
Went off the pseudo code at the bottom of this website:
http://www.seas.gwu.edu/~csci133/fall04/133f04toRPN.html
"""

import sys

precedence = {'+': 0, '-': 0, '*': 1, '/': 1, '^': 2}

nxt = None
src = ""
op = list()
rpn = ""


def p():
    global src
    global rpn
    global op
    scan()
    if nxt == '$':
        sys.exit(0)  # exit with just '$'
    e()
    if nxt == '$':
        while op:
            rpn += op.pop()
        sys.stdout.write("SOURCE:" + src + "")
        sys.stdout.write("\t\tRPN:" + rpn + "\n")
        src = ""
        rpn = ""
        op.clear()
    else:
        error(1)


def e():
    global rpn
    global op
    t()
    while nxt == '+' or nxt == '-':
        operate()
        scan()
        t()


def t():
    global rpn
    global op
    s()
    while nxt == '*' or nxt == '/':
        operate()
        scan()
        s()


def s():
    global rpn
    global op
    f()
    if nxt == '^':
        operate()
        scan()
        s()


def f():
    global rpn
    global op
    while nxt == '+' or nxt == '-':
        scan()
    if nxt.isalnum():  # alphanum
        rpn += nxt
        scan()
    elif nxt == '(':
        op.append(nxt)
        scan()
        e()
        if nxt == ')':
            while op[-1] is not '(':
                rpn += op.pop()
            op.pop()
            scan()
        else:
            error(2)
    else:
        error(3)


def operate():
    global op
    global rpn
    if not op or op[-1] is '(' or precedence[op[-1]] < precedence[str(nxt)]:
        op.append(nxt)
    else:
        while op and op[-1] is not '(' and precedence[str(nxt)] < precedence[op[-1]]:
            rpn += op.pop()
        op.append(nxt)


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