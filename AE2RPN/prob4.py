#!/usr/bin/python3
"""
Written by Rodney Rodriguez
prob4.py: Evaluate the RPN (Extra Credit!)
Starts with AE, translates it to RPN, and then evaluates the RPN.
"""

import sys

from rpn_module import AE, evaluate_rpn


file = open("dae.txt", 'r')
for line_count in file:
    line_count = line_count.strip()
    ae = AE(line_count)
    rpn = ae.to_rpn()
    if rpn:
        sys.stdout.write("ACCEPT, SOURCE: %s\n" % line_count)
        sys.stdout.write("           RPN: %s\n" % rpn)
        sys.stdout.write("         VALUE: %s\n" % evaluate_rpn(rpn))
    else:
        sys.stdout.write("REJECT, SOURCE: %s\n" % line_count)
    print()