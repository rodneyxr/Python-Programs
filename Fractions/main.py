import sys

from fraction import Fraction

'''
Test Code B
'''
print("Initialize Fractions:")
c1 = Fraction(1)
c2 = Fraction(2)
c3 = Fraction(3)
c7 = Fraction(7)
c14 = Fraction(14)
c15 = Fraction(15)
c292 = Fraction(292)

print("\nFirst Truncation:")
# 3 +  1 / ( 7 +  1 / ( 15 +  1))
t1 = c3 + c1 / (c7 + c1 / (c15 + c1))

print("\nSecond Trucation:")
# 3 +  1 / ( 7 +  1 / ( 15 +  1 / ( 1 +  1 /  292)))
t2 = c3 + c1 / (c7 + c1 / (c15 + c1 / (c1 + c1 / c292)))

print("\nThird Truncation:")
# An interesting way to write long expressions.
# This way helps to see the long fraction
t3 = \
    c3 + c1 / (
        c7 + c1 / (
            c15 + c1 / (
                c1 + c1 / (
                    c292 + c1 / (
                        c1 + c1 / (
                            c1 + c1 / (
                                c1 + c1 / (
                                    c2 + c1 / (
                                        c1 + c1 / (
                                            c3 + c1 / (
                                                c1 + c1 / c14
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
print()

print("First Truncation:", t1, "=", t1.to_decimal())
print("Second Tuncation:", t2, "=", t2.to_decimal())
print("Third Tuncation:", t3, "=", t3.to_decimal())

'''
Test Code C
'''
# def pi_cf(i):
# t = Fraction(2 * i + 1)
#     while i >= 1:
#         t = Fraction((2 * i - 1)) + Fraction((i * i)) / t
#         i -= 1
#     return Fraction(4) / t
#
#
# p = pi_cf(20)
# print(p, "=", p.toDecimal())


