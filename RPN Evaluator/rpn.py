# HW 6, Problem 3: Evaluating RPN
import re

rpn_list = ["23+", "234*+", "34*5+", "23+4*", "324+*51+/2-", "53+21+2^^", "2345^*6*+7+", "32^41*2*-12/^3-21*/",
            "23-41+5*^6/24-7*-8-"]

op = re.compile('\d')


def is_operand(c) -> bool:
    if op.match(c):
        return True
    return False


def operate(stack, op):
    if isinstance(stack, list) and len(stack) >= 2:
        b = stack.pop()
        a = stack.pop()
        c = float()
        if op is '+':
            c = a + b
        elif op is '-':
            c = a - b
        elif op is '*':
            c = a * b
        elif op is '/':
            c = a / b
        elif op is '^':
            c = a ** b
        stack.append(c)


def evaluate_rpn(rpn_str) -> float:
    rpn = list(rpn_str)
    rpn.reverse()

    stack = []
    while (rpn):
        c = rpn.pop()
        if is_operand(c):
            stack.append(float(c))
        else:
            operate(stack, c)
    return stack.pop()

print("%-30sValue" % "RPN")
for rpn in rpn_list:
    print("%-30s%d" % (rpn, evaluate_rpn(rpn)))






























