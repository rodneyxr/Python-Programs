        l.d     $f4, 296($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)

# 8($s1) - 216($s1)
        l.d     $f2, 8($s1)
        l.d     $f4, 216($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 312($s1)

# 304($s1) / 312($s1)
        l.d     $f2, 304($s1)
        l.d     $f4, 312($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 320($s1)

# Output 320($s1)
        li      $v0, 3
        l.d     $f12, 320($s1)
        syscall

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

#--------------------#
# Stuff at end
        move    $ra, $s7
        jr      $ra  # ret to sys

# Pow Function
pow:
# truncate $f4
        trunc.w.d $f4, $f4
        cvt.d.w $f4, $f4
        l.d     $f6, 8($s1)
# check if $f4 == 0

        l.d     $f8, 0($s1)
        c.eq.d  $f4, $f8
        bc1t    end
# check if $f4 > 0
        l.d     $f8, 0($s1)
        c.lt.d  $f8, $f4
        bc1t    next
        l.d     $f8, 8($s1)
        div.d   $f2, $f8, $f2
        neg.d   $f4, $f4
# loop as long as $f4 == 0
next:   l.d  $f8, 0($s1)
        c.eq.d  $f4, $f8
        bc1t    end
        mul.d $f6, $f6, $f2
        l.d  $f8, 8($s1)
        sub.d $f4, $f4, $f8
        b next
end:    jr    $ra

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
