# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#

# Read input as double into 176($s1)
        li      $v0, 7
        syscall
        s.d     $f0, 176($s1)

# 176($s1) - 8($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 8($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: i = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 144($s1)

# Read input as double into 184($s1)
        li      $v0, 7
        syscall
        s.d     $f0, 184($s1)

WhileStart0:

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 176($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd0

# Output 176($s1)
        li      $v0, 3
        l.d     $f12, 176($s1)
        syscall

# 176($s1) - 8($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 8($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: m = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 176($s1)

        j       WhileStart0
WhileEnd0:

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

# 16($s1) * 40($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 40($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: x = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 264($s1)

# Assignment: a = 264($s1)
        l.d     $f0, 264($s1)
        s.d     $f0, 80($s1)

WhileStart1:

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 144($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd1

# 184($s1) @ 80($s1)
        l.d     $f2, 184($s1)
        l.d     $f4, 80($s1)
        div.d   $f6, $f2, $f4
        trunc.w.d       $f6, $f6
        cvt.d.w $f6, $f6
        s.d     $f6, 288($s1)

# IF 0
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else0

# Assignment: d = 104($s1)
        l.d     $f0, 104($s1)
        s.d     $f0, 104($s1)

        j       Endif0
Else0:
# Output Blank
        li      $v0, 4
        la      $a0, Blank
        syscall

Endif0:

# 80($s1) * 264($s1)
        l.d     $f2, 80($s1)
        l.d     $f4, 264($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: a = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 80($s1)

# 144($s1) - 8($s1)
        l.d     $f2, 144($s1)
        l.d     $f4, 8($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: i = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 144($s1)

        j       WhileStart1
WhileEnd1:

# Output 184($s1)
        li      $v0, 3
        l.d     $f12, 184($s1)
        syscall

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

#--------------------#
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
