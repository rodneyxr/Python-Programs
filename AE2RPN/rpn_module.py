#!/usr/bin/python3
"""
Written by Rodney Rodriguez
rpn_module.py: This module is to be used for HW7 problem 4 (extra credit)
"""
import sys

# ################# #
# Convert AE to RPN #
# ################# #
class AE:
    precedence = {'+': 0, '-': 0, '*': 1, '/': 1, '^': 2}

    def __init__(self, src):
        self.src = src + '$'
        self.aes = list(self.src[::-1])
        self.op = list()
        self.nxt = ""
        self.rpn = ""


    def to_rpn(self) -> str:
        self.rpn = self.p()
        return self.rpn

    def p(self):
        self.scan()
        self.e()
        if self.nxt is '$':
            while self.op:
                self.rpn += self.op.pop()
            self.op.clear()
            return self.rpn
        else:
            self.rpn = ""
            self.perror("expected '$'\n")

    def e(self):
        self.t()
        while self.nxt is '+' or self.nxt is '-':
            self.operate()
            self.scan()
            self.t()

    def t(self):
        self.s()
        while self.nxt is '*' or self.nxt is '/':
            self.operate()
            self.scan()
            self.s()


    def s(self):
        self.f()
        if self.nxt is '^':
            self.operate()
            self.scan()
            self.s()


    def f(self):
        while self.nxt is '+' or self.nxt is '-':
            self.scan()
        if self.nxt.isalnum():
            self.rpn += self.nxt
            self.scan()
        elif self.nxt is '(':
            self.op.append(self.nxt)
            self.scan()
            self.e()
            if self.nxt is ')':
                while self.op[-1] is not '(':
                    self.rpn += self.op.pop()
                self.op.pop()
                self.scan()
            else:
                self.perror("Expecting ')'\n")
                return False
        else:
            self.perror("Expecting an int or '('\n")
            return False
        return True

    def operate(self):
        op = self.op
        if not op or op[-1] is '(' or AE.precedence[op[-1]] < AE.precedence[str(self.nxt)]:
            op.append(self.nxt)
        else:
            while op and op[-1] is not '(' and AE.precedence[str(self.nxt)] < AE.precedence[op[-1]]:
                self.rpn += op.pop()
            op.append(self.nxt)

    def getc(self):
        if self.aes:
            return self.aes.pop()
        return None


    def scan(self):
        self.nxt = self.getc()
        while self.nxt.isspace():
            self.nxt = self.getc()
        if self.nxt is None:
            sys.exit(-1)


    def perror(self, msg=""):
        self.nxt = self.getc()
        while self.nxt and self.nxt is not "$":
            self.nxt = self.getc()
        if not self.nxt:
            sys.stdout.write("Error: Missing terminating '$'.\n")
            return
        sys.stdout.write("Error: " + msg)


    def __str__(self):
        return "Source: " + self.src


# ############ #
# Evaluate RPN #
# ############ #
def evaluate_rpn(rpn_str) -> float:
    rpn = list(rpn_str)
    rpn.reverse()

    stack = []
    while rpn:
        c = rpn.pop()
        if c.isdigit():
            stack.append(float(c))
        else:
            operate(stack, c)
    return stack.pop()


def operate(stack, op):
    if isinstance(stack, list) and len(stack) >= 2:
        b = stack.pop()
        a = stack.pop()
        if op is '^':
            op = '**'
        stack.append(eval('a' + op + 'b'))
    else:
        sys.stderr.write("Error: rpn_module.py: operate: stack is invalid.\n")
        return False
    return True
