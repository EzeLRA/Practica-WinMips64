.data
cad: .asciiz "23dadsf324gf3"
nums: .word 0

.code
daddi $sp,$0,0x400

daddi $a0,$0,cad
jal PROCESAR_CADENA
sd $v0,nums($0)

halt


PROCESAR_CADENA:
daddi $sp,$sp,-8
sd $ra,0($sp)
daddi $sp,$sp,-8
sd $s0,0($sp)

dadd $t1,$0,$0

dadd $s0,$a0,$0
loop: lbu $a1,0($s0)
jal ES_NUMERO
beqz $v0,continuar1
daddi $t1,$t1,1
continuar1:
daddi $s0,$s0,1
bnez $a1,loop

dadd $v0,$0,$t1

ld $s0,0($sp)
daddi $sp,$sp,8
ld $ra,0($sp)
daddi $sp,$sp,8

jr $ra


ES_NUMERO:

;Evalua de forma escalonada
;1- Caracter < 58(":")
;2- Caracter < 48("0")

dadd $v0,$0,$0

slti $t0,$a1,58
bnez $t0,ev1
j fin
ev1:
slti $t0,$a1,48
bnez $t0,fin

daddi $v0,$v0,1

fin:
jr $ra
