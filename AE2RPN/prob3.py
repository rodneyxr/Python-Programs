#!/usr/bin/python3
"""
Written by Rodney Rodriguez
prob3.py: Parser for the "Odd" Language
    P −−> S $     (P = start)
    S −−> b M b
    M −−> ( L  |  a
    L −−> M a )
"""

import sys

src = ""
accepted = 0
rejected = 0


def p():
    if not s():
        return False
    if scan() is "$":
        return success()
    else:
        return perror("c%d expected '$' but got %c" % (len(src), src[-1]))


def s():
    if scan() is "b":
        if not m():
            return False
    else:
        return perror("c%d expected 'b' but got %c" % (len(src), src[-1]))
    if scan() is not "b":
        return perror("c%d expected 'b' but got '%c'" % (len(src), src[-1]))
    return True


def m():
    c = scan()
    if c is "(":
        if not l():
            return False
    elif c is not "a":
        return perror("c%d expected '(' or 'a' but got '%c'" % (len(src), src[-1]))
    return True


def l():
    if not m():
        return False
    if scan() is "a":
        if scan() is not ")":
            return perror("c%d expected ')' but got '%c'" % (len(src), src[-1]))
    else:
        return perror("c%d expected 'a' but got '%c'" % (len(src), src[-1]))
    return True


def scan():
    global src
    c = file.read(1)
    while c.isspace():
        c = file.read(1)
    if not c:
        sys.stdout.write("{0} Accepted, {1} Rejected, {2} Total\n".format(accepted, rejected, accepted + rejected))
        sys.exit(0)
    src += c
    return c


def perror(msg=""):
    global src
    global rejected
    c = file.read(1)
    src += c
    while c and c is not "$":
        c = file.read(1)
        src += c
    if not c:
        sys.stdout.write("Error: Missing terminating '$'.\n")
        sys.exit(-1)
    sys.stdout.write("Error: " + msg)
    sys.stdout.write(", Source: " + src + "\n")
    src = ""
    rejected += 1
    return False


def success():
    global src
    global accepted
    sys.stdout.write("Accepted, Source: " + src + "\n")
    src = ""
    accepted += 1
    return True


file = open("data3.txt", "r")
while True:
    p()