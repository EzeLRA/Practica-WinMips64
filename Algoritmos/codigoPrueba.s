.data
CONTROL: .word 0x10000
DATA: .word 0x10008
msj1: .asciiz "Bienvenido"
dim: .word 4
res: .ascii ""

.code
lwu $s0,CONTROL($zero)
lwu $s1,DATA($zero)

daddi $t2,$zero,res
ld $t0,dim($zero)

lectura: 

jal char
sb $v0,0($t2)
daddi $t2,$t2,1

daddi $t0,$t0,-1
bnez $t0,lectura

daddi $a0,$zero,msj1
jal imprimir

halt


char:
daddi $t1,$zero,9
sd $t1,0($s0)

lbu $v0,0($s1)

jr $ra


imprimir:
daddi $t0,$zero,6	;Limpieza
sd $t0,0($s0)

sd $a0,0($s1)		;Direccion del mensaje

daddi $t0,$zero,4	;Impresion de la cadena
sd $t0,0($s0)
jr $ra