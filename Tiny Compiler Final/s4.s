
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
