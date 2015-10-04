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
