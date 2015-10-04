# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
# 64($s1) * 16($s1) 
        l.d     $f2, 64($s1)
        l.d     $f4, 16($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: a = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 80($s1)
# 56($s1) * 80($s1) 
        l.d     $f2, 56($s1)
        l.d     $f4, 80($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: b = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 88($s1)
# 88($s1) + 8($s1) 
        l.d     $f2, 88($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: c = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 96($s1)
# 80($s1) / 96($s1) 
        l.d     $f2, 80($s1)
        l.d     $f4, 96($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: d = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 104($s1)
# 24($s1) + 104($s1) 
        l.d     $f2, 24($s1)
        l.d     $f4, 104($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: e = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 112($s1)
# Output 112($s1)
        li      $v0, 3
        l.d     $f12, 112($s1)
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
