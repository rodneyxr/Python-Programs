# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#

# Assignment: f = 0($s1)
        l.d     $f0, 0($s1)
        s.d     $f0, 120($s1)

# Assignment: g = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 128($s1)

# Assignment: n = 0($s1)
        l.d     $f0, 0($s1)
        s.d     $f0, 184($s1)

# Read input as double into 176($s1)
        li      $v0, 7
        syscall
        s.d     $f0, 176($s1)

WhileStart0:

# 184($s1) - 176($s1)
        l.d     $f2, 184($s1)
        l.d     $f4, 176($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd0

# 120($s1) + 128($s1)
        l.d     $f2, 120($s1)
        l.d     $f4, 128($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: h = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 136($s1)

# Output 184($s1)
        li      $v0, 3
        l.d     $f12, 184($s1)
        syscall

# Output Blank
        li      $v0, 4
        la      $a0, Blank
        syscall

# Output 120($s1)
        li      $v0, 3
        l.d     $f12, 120($s1)
        syscall

# Output Blank
        li      $v0, 4
        la      $a0, Blank
        syscall

# 120($s1) % 16($s1)
        l.d     $f2, 120($s1)
        l.d     $f4, 16($s1)
        div.d   $f6, $f2, $f4
        trunc.w.d       $f6, $f6
        cvt.d.w $f6, $f6
        mul.d   $f6, $f6, $f4
        sub.d   $f6, $f2, $f6
        s.d     $f6, 288($s1)

# IF 0
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else0

# Output 8($s1)
        li      $v0, 3
        l.d     $f12, 8($s1)
        syscall

        j       Endif0
Else0:
# Output 16($s1)
        li      $v0, 3
        l.d     $f12, 16($s1)
        syscall

Endif0:

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

# 184($s1) + 8($s1)
        l.d     $f2, 184($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: n = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 184($s1)

# Assignment: f = 128($s1)
        l.d     $f0, 128($s1)
        s.d     $f0, 120($s1)

# Assignment: g = 136($s1)
        l.d     $f0, 136($s1)
        s.d     $f0, 128($s1)

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
