# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
# Assignment: n = 16($s1)
        l.d     $f0, 16($s1)
        s.d     $f0, 184($s1)

# 184($s1) + 184($s1) 
        l.d     $f2, 184($s1)
        l.d     $f4, 184($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 288($s1) + 184($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 184($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Output 296($s1)
        li      $v0, 3
        l.d     $f12, 296($s1)
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
