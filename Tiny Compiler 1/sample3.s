# Compiled by Rodney Rodriguez
main:   move    $s7, $ra
        la      $s1, M # data addr
# Print your name
        li      $v0, 4
        la      $a0, Name
        syscall
# Start of compiled code
#--------------------#
# 16($s1) * 40($s1) 
        l.d     $f2, 16($s1)
        l.d     $f4, 40($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 288($s1)
# 16($s1) * 48($s1) 
        l.d     $f2, 16($s1)
        l.d     $f4, 48($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 296($s1)
# 16($s1) * 56($s1) 
        l.d     $f2, 16($s1)
        l.d     $f4, 56($s1)
        mul.d   $f6, $f2, $f4
        s.d     $f6, 304($s1)
# 304($s1) + 8($s1) 
        l.d     $f2, 304($s1)
        l.d     $f4, 8($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 312($s1)
# 8($s1) / 312($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 312($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 320($s1)
# 8($s1) + 320($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 320($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 328($s1)
# 8($s1) / 328($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 328($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 336($s1)
# 8($s1) + 336($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 336($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 344($s1)
# 8($s1) / 344($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 344($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 352($s1)
# 296($s1) + 352($s1) 
        l.d     $f2, 296($s1)
        l.d     $f4, 352($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 360($s1)
# 8($s1) / 360($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 360($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 368($s1)
# 8($s1) + 368($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 368($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 376($s1)
# 8($s1) / 376($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 376($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 384($s1)
# 8($s1) + 384($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 384($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 392($s1)
# 8($s1) / 392($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 392($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 400($s1)
# 288($s1) + 400($s1) 
        l.d     $f2, 288($s1)
        l.d     $f4, 400($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 408($s1)
# 8($s1) / 408($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 408($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 416($s1)
# 8($s1) + 416($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 416($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 424($s1)
# 8($s1) / 424($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 424($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 432($s1)
# 8($s1) + 432($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 432($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 440($s1)
# 8($s1) / 440($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 440($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 448($s1)
# 64($s1) + 448($s1) 
        l.d     $f2, 64($s1)
        l.d     $f4, 448($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 456($s1)
# 8($s1) / 456($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 456($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 464($s1)
# 8($s1) + 464($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 464($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 472($s1)
# 8($s1) / 472($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 472($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 480($s1)
# 8($s1) + 480($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 480($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 488($s1)
# 8($s1) / 488($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 488($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 496($s1)
# 48($s1) + 496($s1) 
        l.d     $f2, 48($s1)
        l.d     $f4, 496($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 504($s1)
# 8($s1) / 504($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 504($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 512($s1)
# 8($s1) + 512($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 512($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 520($s1)
# 8($s1) / 520($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 520($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 528($s1)
# 8($s1) + 528($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 528($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 536($s1)
# 8($s1) / 536($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 536($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 544($s1)
# 32($s1) + 544($s1) 
        l.d     $f2, 32($s1)
        l.d     $f4, 544($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 552($s1)
# 8($s1) / 552($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 552($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 560($s1)
# 8($s1) + 560($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 560($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 568($s1)
# 8($s1) / 568($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 568($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 576($s1)
# 8($s1) + 576($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 576($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 584($s1)
# 8($s1) / 584($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 584($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 592($s1)
# 16($s1) + 592($s1) 
        l.d     $f2, 16($s1)
        l.d     $f4, 592($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 600($s1)
# 8($s1) / 600($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 600($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 608($s1)
# 8($s1) + 608($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 608($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 616($s1)
# 8($s1) / 616($s1) 
        l.d     $f2, 8($s1)
        l.d     $f4, 616($s1)
        div.d   $f6, $f2, $f4
        s.d     $f6, 624($s1)
# 16($s1) + 624($s1) 
        l.d     $f2, 16($s1)
        l.d     $f4, 624($s1)
        add.d   $f6, $f2, $f4
        s.d     $f6, 632($s1)
# Assignment: e = 632($s1)
        l.d     $f0, 632($s1)
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
