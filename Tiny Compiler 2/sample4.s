# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
# Assignment: m = 24($s1)
        l.d     $f0, 24($s1)
        s.d     $f0, 176($s1)

# 176($s1) - 24($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 24($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# IF 0
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else0

# Output 16($s1)
        li      $v0, 3
        l.d     $f12, 16($s1)
        syscall

        j       Endif0
Else0:
# Output 24($s1)
        li      $v0, 3
        l.d     $f12, 24($s1)
        syscall

Endif0:

# 176($s1) - 40($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 40($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# IF 1
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Else1

# Output 32($s1)
        li      $v0, 3
        l.d     $f12, 32($s1)
        syscall

        j       Endif1
Else1:
# Output 40($s1)
        li      $v0, 3
        l.d     $f12, 40($s1)
        syscall

Endif1:

# 176($s1) - 24($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 24($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# IF 2
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Endif2

# Output 48($s1)
        li      $v0, 3
        l.d     $f12, 48($s1)
        syscall

Endif2:

# 176($s1) - 40($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 40($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# IF 3
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    Endif3

# Output 56($s1)
        li      $v0, 3
        l.d     $f12, 56($s1)
        syscall

Endif3:

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
