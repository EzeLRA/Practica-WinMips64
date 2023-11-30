.data
CONTROL: .word 0x10000
DATA: .word 0x10008
rojo: .byte 255,0,0,0

.code
ld $s0,CONTROL($0)
ld $s1,DATA($0)

daddi $t0,$0,7
sd $t0,0($s0)

ld $t0,rojo($0)
sw $t0,0($s1)

dadd $t0,$0,$0
dadd $t1,$0,$0

daddi $t3,$0,5 ;Maximo
daddi $t4,$0,1 ;Operando

sb $t0,5($s1)

loop:

sb $t1,4($s1)

daddi $t2,$0,5
sd $t2,0($s0)

dadd $t1,$t1,$t4

bne $t1,$t3,loop

loop2:
sb $t0,5($s1)

daddi $t2,$0,5
sd $t2,0($s0)

dadd $t0,$t0,$t4

bne $t0,$t3,loop2

daddi $t4,$0,-1
daddi $t3,$0,0

beqz $t0,fin

j loop
fin:

halt