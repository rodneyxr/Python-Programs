# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#

# Assignment: f = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 120($s1)

# Assignment: g = 16($s1)
        l.d     $f0, 16($s1)
        s.d     $f0, 128($s1)

# Assignment: n = 24($s1)
        l.d     $f0, 24($s1)
        s.d     $f0, 184($s1)

# Read input as double into 176($s1)
        li      $v0, 7
        syscall
        s.d     $f0, 176($s1)

WhileStart0:

# 176($s1) - 184($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 184($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd0

# Output 184($s1)
        li      $v0, 3
        l.d     $f12, 184($s1)
        syscall

# Output Tab
        li      $v0, 4
        la      $a0, Tab
        syscall

# Output 128($s1)
        li      $v0, 3
        l.d     $f12, 128($s1)
        syscall

# Output Tab
        li      $v0, 4
        la      $a0, Tab
        syscall

# Assignment: j = 128($s1)
        l.d     $f0, 128($s1)
        s.d     $f0, 152($s1)

# Assignment: d = 16($s1)
        l.d     $f0, 16($s1)
        s.d     $f0, 104($s1)

# Assignment: t = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 232($s1)

WhileStart1:

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 232($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd1

# 152($s1) % 104($s1)
        l.d     $f2, 152($s1)
        l.d     $f4, 104($s1)
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

# Assignment: e = 0($s1)
        l.d     $f0, 0($s1)
        s.d     $f0, 112($s1)

        j       Endif0
Else0:
# Assignment: e = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 112($s1)

Endif0:

WhileStart2:

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 112($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd2

# 152($s1) / 104($s1)
        l.d     $f2, 152($s1)
        l.d     $f4, 104($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: j = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 152($s1)

# Output 104($s1)
        li      $v0, 3
        l.d     $f12, 104($s1)
        syscall

# Output Blank
        li      $v0, 4
        la      $a0, Blank
        syscall

# 152($s1) % 104($s1)
        l.d     $f2, 152($s1)
        l.d     $f4, 104($s1)
        div.d   $f6, $f2, $f4
        trunc.w.d       $f6, $f6
        cvt.d.w $f6, $f6
        mul.d   $f6, $f6, $f4
        sub.d   $f6, $f2, $f6
        s.d     $f6, 288($s1)

# IF 1
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else1

# Assignment: e = 0($s1)
        l.d     $f0, 0($s1)
        s.d     $f0, 112($s1)

        j       Endif1
Else1:
# Assignment: e = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 112($s1)

Endif1:

        j       WhileStart2
WhileEnd2:

# 152($s1) - 8($s1)
        l.d     $f2, 152($s1)
        l.d     $f4, 8($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# IF 2
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else2

# Assignment: t = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 232($s1)

        j       Endif2
Else2:
# Assignment: t = 0($s1)
        l.d     $f0, 0($s1)
        s.d     $f0, 232($s1)

Endif2:

# 104($s1) - 16($s1)
        l.d     $f2, 104($s1)
        l.d     $f4, 16($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# IF 3
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else3

# 104($s1) + 16($s1)
        l.d     $f2, 104($s1)
        l.d     $f4, 16($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: d = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 104($s1)

        j       Endif3
Else3:
# Assignment: d = 24($s1)
        l.d     $f0, 24($s1)
        s.d     $f0, 104($s1)

Endif3:

        j       WhileStart1
WhileEnd1:

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

# 120($s1) + 128($s1)
        l.d     $f2, 120($s1)
        l.d     $f4, 128($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: h = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 136($s1)

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
