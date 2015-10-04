# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
# Assignment: n = 48($s1)
        l.d     $f0, 48($s1)
        s.d     $f0, 184($s1)

WhileStart0:

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 184($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd0

# 184($s1) * 184($s1) 
        l.d     $f2, 184($s1)
        l.d     $f4, 184($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Output 288($s1)
        li      $v0, 3
        l.d     $f12, 288($s1)
        syscall

# Output Blank
        li      $v0, 4
        la      $a0, Blank
        syscall

# 184($s1) - 8($s1)
        l.d     $f2, 184($s1)
        l.d     $f4, 8($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: n = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 184($s1)

        j       WhileStart0
WhileEnd0:

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
