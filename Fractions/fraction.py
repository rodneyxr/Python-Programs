# fraction.py: implement fractions
import sys
# num = top = numerator
# den = bottom = denominator


def gcd(m, n):  # m can be negative
    while m % n != 0:
        oldm = m
        oldn = n
        m = oldn
        n = oldm % oldn
    return n


class Fraction:
    def __init__(self, top, bottom=1):  # set the denominator equal to 1 if no second parameter is specified
        com = gcd(top, bottom)
        self.num = top // com
        self.den = bottom // com
        sys.stdout.write("New: ")
        Fraction.show(self)
        sys.stdout.write("\n")

    def getNum(self):
        return self.num

    def getDen(self):
        return self.den

    def to_decimal(self):  # converts the fraction to a decimal number
        return self.num / self.den

    def show(self):
        sys.stdout.write(str(self.num) + "/" + str(self.den))

    def __str__(self):
        return str(self.num) + "/" + str(self.den)

    def __add__(self, other):
        newnum = self.num * other.den + self.den * other.num
        newden = self.den * other.den
        return Fraction(newnum, newden)

    def __sub__(self, other):
        newnum = self.num * other.den - self.den * other.num
        newden = self.den * other.den
        return Fraction(newnum, newden)

    def __mul__(self, other):
        newnum = self.num * other.num
        newden = self.den * other.den
        return Fraction(newnum, newden)

    def __truediv__(self, other):  # python3 has replaced __div__ with __truediv__
        newnum = self.num * other.den
        newden = self.den * other.num
        return Fraction(newnum, newden)

    def __eq__(self, other):
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        return firstnum == secondnum

    def __ne__(self, other):
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        return firstnum != secondnum

    def __lt__(self, other):
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        return firstnum < secondnum

    def __le__(self, other):
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        return firstnum <= secondnum

    def __gt__(self, other):
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        return firstnum > secondnum

    def __ge__(self, other):
        firstnum = self.num * other.den
        secondnum = other.num * self.den
        return firstnum >= secondnum


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

print("\nSecond Truncation:")
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
print("Second Truncation:", t2, "=", t2.to_decimal())
print("Third Truncation:", t3, "=", t3.to_decimal())

'''
Test Code C
'''
# def pi_cf(i):
#     t = Fraction(2 * i + 1)
#     while i >= 1:
#         t = Fraction((2 * i - 1)) + Fraction((i * i)) / t
#         i -= 1
#     return Fraction(4) / t
#
#
# p = pi_cf(20)
# print(p, "=", p.to_decimal())