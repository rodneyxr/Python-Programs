# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#

# Read input as double into 184($s1)
        li      $v0, 7
        syscall
        s.d     $f0, 184($s1)

# Assignment: p = 16($s1)
        l.d     $f0, 16($s1)
        s.d     $f0, 200($s1)

# Assignment: b = 0($s1)
        l.d     $f0, 0($s1)
        s.d     $f0, 88($s1)

# Assignment: i = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 144($s1)

WhileStart0:

# 184($s1) - 144($s1)
        l.d     $f2, 184($s1)
        l.d     $f4, 144($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd0

# Assignment: k = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 160($s1)

# 16($s1) + 88($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 88($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: x = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 264($s1)

# Assignment: y = 264($s1)
        l.d     $f0, 264($s1)
        s.d     $f0, 272($s1)

WhileStart1:

# 16($s1) * 40($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 40($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 160($s1) - 288($s1)
        l.d     $f2, 160($s1)
        l.d     $f4, 288($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 296($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd1

# 16($s1) * 272($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 272($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)

# 264($s1) / 304($s1)
        l.d     $f2, 264($s1)
        l.d     $f4, 304($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 312($s1)

# 272($s1) / 16($s1)
        l.d     $f2, 272($s1)
        l.d     $f4, 16($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 320($s1)

# 312($s1) + 320($s1)
        l.d     $f2, 312($s1)
        l.d     $f4, 320($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 328($s1)

# Assignment: y = 328($s1)
        l.d     $f0, 328($s1)
        s.d     $f0, 272($s1)

# 160($s1) + 8($s1)
        l.d     $f2, 160($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: k = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 160($s1)

        j       WhileStart1
WhileEnd1:

# Assignment: b = 272($s1)
        l.d     $f0, 272($s1)
        s.d     $f0, 88($s1)

# 16($s1) / 88($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 88($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: t = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 232($s1)

# 200($s1) * 232($s1)
        l.d     $f2, 200($s1)
        l.d     $f4, 232($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: p = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 200($s1)

# 144($s1) + 8($s1)
        l.d     $f2, 144($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: i = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 144($s1)

# Output 144($s1)
        li      $v0, 3
        l.d     $f12, 144($s1)
        syscall

# Output Blank
        li      $v0, 4
        la      $a0, Blank
        syscall

# Output 200($s1)
        li      $v0, 3
        l.d     $f12, 200($s1)
        syscall

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

        j       WhileStart0
WhileEnd0:

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
