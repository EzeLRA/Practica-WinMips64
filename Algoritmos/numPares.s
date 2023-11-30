.data
num: .word 4,8,5,3,2
dim: .word 5
Impares: .word 0
Pares: .word 0

.code

daddi $a0,$0,num
ld $a1,dim($0)
jal contarImpares
sd $v0,Impares($0)

daddi $a0,$0,num
ld $a1,dim($0)
jal contarPares
sd $v0,Pares($0)

halt


contarImpares:
daddi $v0,$0,0

loop:
ld $t0,0($a0)
andi $t1,$t0,1

beqz $t1,cont
daddi $v0,$v0,1
cont:
daddi $a1,$a1,-1
daddi $a0,$a0,8
bnez $a1,loop

jr $ra

contarPares:
daddi $v0,$0,0

loop:
ld $t0,0($a0)
andi $t1,$t0,1

bnez $t1,cont2
daddi $v0,$v0,1
cont2:

daddi $a1,$a1,-1
daddi $a0,$a0,8
bnez $a1,loop

jr $ra