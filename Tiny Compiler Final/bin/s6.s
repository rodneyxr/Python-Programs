# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#

# Assignment: s = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 224($s1)

# Assignment: m = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 176($s1)

# Assignment: d = 24($s1)
        l.d     $f0, 24($s1)
        s.d     $f0, 104($s1)

# 64($s1) * 32($s1)
        l.d     $f2, 64($s1)
        l.d     $f4, 32($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 288($s1) + 8($s1)
        l.d     $f2, 288($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: w = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 256($s1)

WhileStart0:

# 104($s1) - 256($s1)
        l.d     $f2, 104($s1)
        l.d     $f4, 256($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd0

# Assignment: m = 176($s1)
        l.d     $f0, 176($s1)
        neg.d   $f0, $f0
        s.d     $f0, 176($s1)

# 8($s1) / 104($s1)
        l.d     $f2, 8($s1)
        l.d     $f4, 104($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: t = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 232($s1)

# 176($s1) * 232($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 232($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 224($s1) + 288($s1)
        l.d     $f2, 224($s1)
        l.d     $f4, 288($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: s = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 224($s1)

# 104($s1) + 16($s1)
        l.d     $f2, 104($s1)
        l.d     $f4, 16($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: d = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 104($s1)

        j       WhileStart0
WhileEnd0:

# Output 224($s1)
        li      $v0, 3
        l.d     $f12, 224($s1)
        syscall

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

# Assignment: p = 224($s1)
        l.d     $f0, 224($s1)
        s.d     $f0, 200($s1)

# Assignment: m = 8($s1)
        l.d     $f0, 8($s1)
        neg.d   $f0, $f0
        s.d     $f0, 176($s1)

# Assignment: b = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 88($s1)

# 32($s1) * 32($s1)
        l.d     $f2, 32($s1)
        l.d     $f4, 32($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: n = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 184($s1)

# Assignment: e = 8($s1)
        l.d     $f0, 8($s1)
        s.d     $f0, 112($s1)

# Assignment: d = 256($s1)
        l.d     $f0, 256($s1)
        s.d     $f0, 104($s1)

# 64($s1) * 64($s1)
        l.d     $f2, 64($s1)
        l.d     $f4, 64($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 288($s1) + 8($s1)
        l.d     $f2, 288($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: w = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 256($s1)

WhileStart1:

# 104($s1) - 256($s1)
        l.d     $f2, 104($s1)
        l.d     $f4, 256($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Test while condition
        l.d     $f2, 0($s1)
        l.d     $f4, 288($s1)
        c.eq.d  $f2, $f4
        bc1t    WhileEnd1

# Assignment: m = 176($s1)
        l.d     $f0, 176($s1)
        neg.d   $f0, $f0
        s.d     $f0, 176($s1)

# 8($s1) / 104($s1)
        l.d     $f2, 8($s1)
        l.d     $f4, 104($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: t = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 232($s1)

# 176($s1) * 232($s1)
        l.d     $f2, 176($s1)
        l.d     $f4, 232($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 224($s1) + 288($s1)
        l.d     $f2, 224($s1)
        l.d     $f4, 288($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: s = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 224($s1)

# 88($s1) * 184($s1)
        l.d     $f2, 88($s1)
        l.d     $f4, 184($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 288($s1) / 112($s1)
        l.d     $f2, 288($s1)
        l.d     $f4, 112($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: b = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 88($s1)

# Output 88($s1)
        li      $v0, 3
        l.d     $f12, 88($s1)
        syscall

# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall

# 224($s1) * 88($s1)
        l.d     $f2, 224($s1)
        l.d     $f4, 88($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 200($s1) + 288($s1)
        l.d     $f2, 200($s1)
        l.d     $f4, 288($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)

# Assignment: p = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 200($s1)

# 184($s1) - 8($s1)
        l.d     $f2, 184($s1)
        l.d     $f4, 8($s1)
        sub.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: n = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 184($s1)

# 112($s1) + 8($s1)
        l.d     $f2, 112($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: e = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 112($s1)

# 104($s1) + 16($s1)
        l.d     $f2, 104($s1)
        l.d     $f4, 16($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# Assignment: d = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 104($s1)

        j       WhileStart1
WhileEnd1:

# 16($s1) * 56($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 56($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)

# 16($s1) ^ 288($s1)
        l.d     $f2, 16($s1)
        l.d     $f4, 288($s1)
        jal     pow
        s.d     $f6, 296($s1)

# 200($s1) / 296($s1)
        l.d     $f2, 200($s1)
        l.d     $f4, 296($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)

# Assignment: p = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 200($s1)

# Output 200($s1)
        li      $v0, 3
        l.d     $f12, 200($s1)
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
