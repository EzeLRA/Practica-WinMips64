.data
dim: .word 6
max: .word -1
min: .word 10
m: .word 0
M: .word 0
Tabla: .word 0,1,2,5,6,7

.code
daddi $a0,$0,Tabla
ld $a1,max($0)
jal procesarMax
sd $v0,M($0)

daddi $a0,$0,Tabla
ld $a1,min($0)
jal procesarMin
sd $v0,m($0)

halt

procesarMax:
ld $t0,dim($0)
loop: ld $t1,0($a0)
slt $t2,$t1,$a1
bnez $t2,continuar1
dadd $a0,$0,$t1

continuar1:
daddi $t0,$t0,-1
daddi $a0,$a0,8

bnez $t0,loop
dadd $v0,$0,$a0
jr $ra

procesarMin:
ld $t0,dim($0)
loop: ld $t1,0($a0)
slt $t2,$t1,$a1
beqz $t2,continuar2
dadd $a0,$0,$t1

continuar2:
daddi $t0,$t0,-1
daddi $a0,$a0,8

bnez $t0,loop
dadd $v0,$0,$a0
jr $ra