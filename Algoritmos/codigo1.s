.data
XX: .word 81
.code
daddi $t1,$zero,6
daddi $t1,$t1,81
loop: daddi $t1,$t1,-1
bnez $t1,loop
halt
