#!/usr/bin/python3
"""
Written by Rodney Rodriguez
compiler.py: basic compiler for Tiny Language. Supports +-*/, (), output,
if-else statements, and while loops
"""

import sys
import os.path

ADD_SUB = ('+', '-')
MUL_DIV = ('*', '/')

M = {'0': 0, '1': 8, '2': 16, '3': 24, '4': 32, '5': 40, '6': 48, '7': 56, '8': 64, '9': 72, 'a': 80, 'b': 88, 'c': 96,
     'd': 104, 'e': 112, 'f': 120, 'g': 128, 'h': 136, 'i': 144, 'j': 152, 'k': 160, 'l': 168, 'm': 176, 'n': 184,
     'o': 192, 'p': 200, 'q': 208, 'r': 216, 's': 224, 't': 232, 'u': 240, 'v': 248, 'w': 256, 'x': 264, 'y': 272,
     'z': 280, 't0': 288, 't1': 296, 't2': 304, 't3': 312, 't4': 320, 't5': 328, 't6': 336, 't7': 344, 't8': 352,
     't9': 360, 't10': 368, 't11': 376, 't12': 386}

M_INV = {v: k for k, v in M.items()}

F_REG = ('$f0', '$f2', '$f4', '$f6', '$f8', '$f10', '$f12', '$f14', '$f16',
         '$f18', '$f20', '$f22', '$f24', '$f26', '$f28', '$f30')

FRAMEWORK_BEG = r"""# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
"""

FRAMEWORK_END = r"""#--------------------#
# Stuff at end
        move    $ra, $s7
        jr      $ra  # ret to sys
# data declarations
        .data
        .align  3
M:      .double 0.,1.,2.,3.,4.,5.
        .double 6.,7.,8.,9. # cons
        .space  208  # a to z
        .space  1000 # 125 temps
Blank:  .asciiz " "
NewL:   .asciiz "\n"
Tab:    .asciiz "\t"
Name:   .asciiz "Executed by Rodney Rodriguez\n"
"""

# Parser variables
src = ""
nxt = None

# Compiler variables
line_count = 1
char_count = 0
accepted = 0
rejected = 0

# Assembly varaibles
code = ""
tmp_count = 0
while_count = 0
if_count = 0


def m():
    scan()
    s()
    while nxt is not '$':
        s()
    if nxt is '$':
        return success()
    else:
        return perror("'$'")


def s():
    if nxt is '<':
        p()
    elif nxt is '[':
        i()
    elif nxt is '{':
        w()
    elif nxt.islower():
        a()
    else:
        perror("'<' or '[' or '{' or a variable")
    return None


def i():  # if statement
    global code
    global if_count
    if_num = if_count  # capture if_count for this instance
    if_count += 1  # increment global if_count for future instances
    if nxt is '[':
        scan()
        res = e()
        mips("# IF {0}\n".format(if_num))
        mips("        l.d     $f2, {0}($s1)\n".format(M['0']))
        mips("        l.d     $f4, {0}($s1)\n".format(res))
        mips("        c.eq.d  $f2, $f4\n")
        mips("        bc1t    Else{0}\n\n".format(if_num))  # needs to go to Endif{0} if no ':' is present
        if nxt is '?':
            scan()
            s()
            while nxt not in (':', ']'):
                s()
            if nxt is ':':
                mips("        j       Endif{0}\n".format(if_num))
                mips("Else{0}:\n".format(if_num))
                scan()
                s()
                while nxt is not ']':
                    s()
            elif nxt is ']':
                code = code.replace("Else{0}".format(if_num), "Endif{0}".format(if_num))  # Removes Else
            else:
                perror("':' or ']'")
            mips("Endif{0}:\n\n".format(if_num))
        else:
            perror("'?'")
        scan()
    return None


def w():  # while loop
    global while_count
    while_num = while_count
    while_count += 1
    if nxt is '{':
        mips("WhileStart{0}:\n\n".format(while_num))
        scan()
        res = e()
        mips("# Test while condition\n")
        mips("        l.d     $f2, {0}($s1)\n".format(M['0']))
        mips("        l.d     $f4, {0}($s1)\n".format(res))
        mips("        c.eq.d  $f2, $f4\n")
        mips("        bc1t    WhileEnd{0}\n\n".format(while_num))
        if nxt is '?':
            scan()
            s()
            while nxt is not '}':
                s()
            mips("        j       WhileStart{0}\n".format(while_num))
            mips("WhileEnd{0}:\n\n".format(while_num))
        else:
            perror("'?'")
        scan()
    return None


def a():  # assignment
    global tmp_count
    if nxt.islower():
        var = M[nxt]
        scan()
        if nxt is '=':
            scan()
            res = e()
            mips("# Assignment: {0} = {1}($s1)\n".format(M_INV[var], res))
            mips("        l.d     $f0, {0}($s1)\n".format(res))
            mips("        s.d     $f0, {0}($s1)\n\n".format(var))
            tmp_count = 0
            if nxt is ';':
                scan()
            else:
                return perror("';'")
        else:
            return perror("'='")
    return None


def p():  # print statment
    global tmp_count
    if nxt is '<':
        scan()
        if nxt is 'N':
            mips("# Output New Line\n")
            mips("        li      $v0, 4\n")
            mips("        la      $a0, NewL\n")
            mips("        syscall\n\n")
            scan()
        elif nxt is 'B':
            mips("# Output Blank\n")
            mips("        li      $v0, 4\n")
            mips("        la      $a0, Blank\n")
            mips("        syscall\n\n")
            scan()
        elif nxt.islower or nxt.isdigit:
            res = e()
            mips("# Output {0}($s1)\n".format(res))
            mips("        li      $v0, 3\n")
            mips("        l.d     $f12, {0}($s1)\n".format(res))
            mips("        syscall\n\n")
        else:
            perror("a variable/digit or 'N' or 'B'")
        if nxt is ';':
            scan()
        else:
            perror("';'")
        tmp_count = 0
    else:
        return perror("'<'")

    return None


def e():  # addition and subtraction
    res = v1 = t()
    while nxt in ADD_SUB:
        op = nxt
        scan()
        v2 = t()
        res = next_tmp()
        if op is '+':
            mips("# {0}($s1) + {1}($s1) \n".format(v1, v2))
            mips("        l.d     $f2, {0}($s1)\n".format(v1))
            mips("        l.d     $f4, {0}($s1)\n".format(v2))
            mips("        add.d   $f6, $f2, $f4\n")
            mips("        s.d     $f6, {0}($s1)\n\n".format(res))
        elif op is '-':
            mips("# {0}($s1) - {1}($s1)\n".format(v1, v2))
            mips("        l.d     $f2, {0}($s1)\n".format(v1))
            mips("        l.d     $f4, {0}($s1)\n".format(v2))
            mips("        sub.d   $f6, $f2, $f4\n")
            mips("        s.d     $f6, {0}($s1)\n\n".format(res))
        v1 = res
    return res


def t():  # multiplication and division
    res = v1 = f()
    while nxt in MUL_DIV:
        op = nxt
        scan()
        v2 = f()
        res = next_tmp()
        if op is '*':
            mips("# {0}($s1) * {1}($s1) \n".format(v1, v2))
            mips("        l.d     $f2, {0}($s1)\n".format(v1))
            mips("        l.d     $f4, {0}($s1)\n".format(v2))
            mips("        mul.d   $f6, $f2, $f4\n")
            mips("        s.d     $f6, {0}($s1)\n\n".format(res))
        elif op is '/':
            mips("# {0}($s1) / {1}($s1) \n".format(v1, v2))
            mips("        l.d     $f2, {0}($s1)\n".format(v1))
            mips("        l.d     $f4, {0}($s1)\n".format(v2))
            mips("        div.d   $f6, $f2, $f4\n")
            mips("        s.d     $f6, {0}($s1)\n\n".format(res))
        v1 = res
    return res


def f():  # variable, digit or (E)
    global nxt
    if nxt.islower():
        res = M[nxt]
        scan()
    elif nxt.isdigit():
        res = M[nxt]
        scan()
    elif nxt is '(':
        scan()
        res = e()
        if nxt is ')':
            scan()
        else:
            return perror("')'")
    else:
        return perror("'(', digit, or lower-case")
    return res


def mips(mipscode=""):
    global code
    code += mipscode


def next_tmp():
    global tmp_count
    addr = M['t0'] + (tmp_count * 8)
    tmp_count += 1
    return addr


def scan():
    global src
    global nxt
    global line_count
    global char_count
    c = getc()
    while c.isspace():
        src += c
        if c is '\n':
            line_count += 1
            char_count = 0
        c = getc()
    if not c:
        if accepted is 0 and rejected is 0:
            perror()
        sys.stdout.write("{0} Accepted, {1} Rejected, {2} Total\n".format(accepted, rejected, accepted + rejected))
        sys.exit(0)
    src += c
    nxt = c
    if c is '#':
        c = comment()
        scan()
    return c


def comment():
    global src
    c = '#'
    while c is not '\n':
        c = getc()
        src += c
    return c


def getc():
    global char_count
    c = fin.read(1)
    if len(c) < 1:
        return ""
    char_count += 1
    return c


def print_src(line=0):
    sys.stdout.write("Source:\n")
    lnum = 0
    for lc in iter(src.splitlines()):
        lnum += 1
        sys.stdout.write("%s%+7s: %s\n" % ([" ", ">"][lnum == line], lnum, lc))
    if line <= 0:
        sys.stdout.write(">\n")


def perror(msg=""):
    global src
    global rejected
    global line_count
    c_err = char_count
    if nxt is not '$':
        c = getc()
        src += c
        while c and c is not "$":
            c = getc()
            src += c
        if not c:
            sys.stdout.write("Error: Missing terminating '$'.\n")
            fin.close()
            sys.exit(-1)
    else:
        sys.stdout.write("Error: Reached '$' unexpectedly.\n")
        fin.close()
        sys.exit(-1)
    print_src(line_count)
    if src[c_err - 1].isspace():
        sys.stdout.write("Error: {0},c{1} missing {2}.\n".format(line_count, c_err, msg))
    else:
        sys.stdout.write("Error: {0},c{1} expected {2} but got '{3}'.\n".format(line_count, c_err, msg, src[c_err - 1]))
    src = ""
    rejected += 1
    return False


def success():
    global src
    global accepted
    print_src()
    sys.stdout.write("Successfully compiled with no errors.\n")
    src = ""
    accepted += 1
    return True


fin_name = input("Source File: ")
fout_name = input("MIPS File: ")
fin = None
if os.path.isfile(fin_name):
    fin = open(fin_name, "r")
else:
    sys.stdout.write("Error: could not open {0}".format(fin_name))
    sys.exit(-1)

successful = m()
fin.close()

if successful:
    fout = open(fout_name, "w")
    fout.write(FRAMEWORK_BEG)
    fout.write(code)
    fout.write(FRAMEWORK_END)
    fout.close()
