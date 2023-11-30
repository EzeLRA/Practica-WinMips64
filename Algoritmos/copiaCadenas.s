.data
CONTROL: .word 0x10000
DATA: 	 .word 0x10008
msj1:	 .asciiz "Cadena Convertida:"
msj2:	 .asciiz "Letras Cambiadas:"
cad1: 	 .asciiz "noMbRe<-MaYuscUlaS"
mayu: 	 .ascii ""

.code
daddi $sp,$0,0x400
ld $s0,CONTROL($0)
ld $s1,DATA($0)

daddi $a0,$0,cad1
daddi $a1,$0,mayu
jal PROCESAR_CADENA

daddi $a0,$0,msj1
jal IMPRIMIR
daddi $a0,$0,cad1
jal IMPRIMIR

daddi $a0,$0,msj2
jal IMPRIMIR
daddi $a0,$0,mayu
jal IMPRIMIR

halt



PROCESAR_CADENA:
daddi $sp,$sp,-8
sd $ra,0($sp)
daddi $sp,$sp,-8
sd $s2,0($sp)
daddi $sp,$sp,-8
sd $s3,0($sp)

dadd $s2,$0,$a0
dadd $s3,$0,$a1

loop:

lbu $t0,0($s2)
beqz $t0,fin

dadd $a0,$0,$s2
jal ES_MIN

beqz $v0,continuar

lbu $a0,0($s2)
jal CONVERTIR
dadd $t0,$0,$v0

sb $t0,0($s3)
daddi $s3,$s3,1

j continuar2

continuar:

lbu $t0,0($s2)
continuar2:

sb $t0,0($s2)

daddi $s2,$s2,1

j loop

fin:

ld $s3,0($sp)
daddi $sp,$sp,8
ld $s2,0($sp)
daddi $sp,$sp,8
ld $ra,0($sp)
daddi $sp,$sp,8
jr $ra

ES_MIN:
lbu $t0,0($a0)
slti $t1,$t0,97 	; $t1 < 97 = 1 sino $t1 > 97 = 0
dadd $v0,$0,$0
bnez $t1,noCumple	;Minuscula
daddi $v0,$v0,1
noCumple:		;Mayuscula
jr $ra

CONVERTIR:
daddi $v0,$a0,-32
jr $ra

IMPRIMIR:
;daddi $t0,$0,6
;sd $t0,0($s0)
sd $a0,0($s1)
daddi $t0,$0,4
sd $t0,0($s0)
jr $ra
