# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
# 24($s1) * 56($s1) 
        l.d     $f2, 24($s1)
        l.d     $f4, 56($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: f = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 120($s1)
# 72($s1) + 32($s1) 
        l.d     $f2, 72($s1)
        l.d     $f4, 32($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 120($s1) + 288($s1) 
        l.d     $f2, 120($s1)
        l.d     $f4, 288($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# Assignment: g = 296($s1)
        l.d     $f0, 296($s1)
        s.d     $f0, 128($s1)
# 120($s1) + 128($s1) 
        l.d     $f2, 120($s1)
        l.d     $f4, 128($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# Assignment: h = 288($s1)
        l.d     $f0, 288($s1)
        s.d     $f0, 136($s1)
# Output 136($s1)
        li      $v0, 3
        l.d     $f12, 136($s1)
        syscall
# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall
# 120($s1) * 120($s1) 
        l.d     $f2, 120($s1)
        l.d     $f4, 120($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 128($s1) * 128($s1) 
        l.d     $f2, 128($s1)
        l.d     $f4, 128($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: a = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 80($s1)
# 128($s1) * 136($s1) 
        l.d     $f2, 128($s1)
        l.d     $f4, 136($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 120($s1) * 128($s1) 
        l.d     $f2, 120($s1)
        l.d     $f4, 128($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: b = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 88($s1)
# 128($s1) * 128($s1) 
        l.d     $f2, 128($s1)
        l.d     $f4, 128($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 136($s1) * 136($s1) 
        l.d     $f2, 136($s1)
        l.d     $f4, 136($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: c = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 96($s1)
# Output 96($s1)
        li      $v0, 3
        l.d     $f12, 96($s1)
        syscall
# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall
# 80($s1) * 80($s1) 
        l.d     $f2, 80($s1)
        l.d     $f4, 80($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 88($s1) * 88($s1) 
        l.d     $f2, 88($s1)
        l.d     $f4, 88($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: f = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 120($s1)
# 88($s1) * 96($s1) 
        l.d     $f2, 88($s1)
        l.d     $f4, 96($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 80($s1) * 88($s1) 
        l.d     $f2, 80($s1)
        l.d     $f4, 88($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: g = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 128($s1)
# 96($s1) * 96($s1) 
        l.d     $f2, 96($s1)
        l.d     $f4, 96($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 88($s1) * 88($s1) 
        l.d     $f2, 88($s1)
        l.d     $f4, 88($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: h = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 136($s1)
# Output 136($s1)
        li      $v0, 3
        l.d     $f12, 136($s1)
        syscall
# Output New Line
        li      $v0, 4
        la      $a0, NewL
        syscall
# 120($s1) * 120($s1) 
        l.d     $f2, 120($s1)
        l.d     $f4, 120($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 128($s1) * 128($s1) 
        l.d     $f2, 128($s1)
        l.d     $f4, 128($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: a = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 80($s1)
# 128($s1) * 136($s1) 
        l.d     $f2, 128($s1)
        l.d     $f4, 136($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 120($s1) * 128($s1) 
        l.d     $f2, 120($s1)
        l.d     $f4, 128($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: b = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 88($s1)
# 128($s1) * 128($s1) 
        l.d     $f2, 128($s1)
        l.d     $f4, 128($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 136($s1) * 136($s1) 
        l.d     $f2, 136($s1)
        l.d     $f4, 136($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 288($s1) + 296($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 296($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# Assignment: c = 304($s1)
        l.d     $f0, 304($s1)
        s.d     $f0, 96($s1)
# Output 96($s1)
        li      $v0, 3
        l.d     $f12, 96($s1)
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
