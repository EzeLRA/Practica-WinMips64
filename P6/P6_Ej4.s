.data
CONTROL: .word 0x10000
DATA: .word 10008
msj1: .asciiz "Bienvenido"
msj2: .asciiz "ERROR"
clave: .ascii "prba"
dim: .word 4
res1: .word 0
res: .ascii ""

.code
lwu $s0,CONTROL($zero)
lwu $s1,DATA($zero)

;LECTURA
volver:

daddi $t2,$zero,res
ld $t0,dim($zero)

lectura: 

jal char
sb $v0,0($t2)
daddi $t2,$t2,1

daddi $t0,$t0,-1
bnez $t0,lectura


;VERIFICACION

ld $a0,dim($zero)
daddi $a1,$zero,clave
daddi $a2,$zero,res
jal verificarClave
bnez $v0,COND1
j COND2

;IMPRIME ERROR DE CONTRASEÑA
COND1:

daddi $a0,$zero,msj2
jal imprimir

j volver

;IMPRIME LA BIENVENIDA
COND2:

daddi $a0,$zero,msj1
jal imprimir

halt


;SUBRUTINA DE LECTURA
char:
daddi $t1,$zero,9
sd $t1,0($s0)

lbu $v0,0($s1)
jr $ra

;SUBRUTINA PARA COMPARAR
verificarClave:

loop: lbu $t1,0($a1)
lbu $t2,0($a2)
daddi $a1,$a1,1
daddi $a2,$a2,1
daddi $a0,$a0,-1

beqz $a0,cumple
beq $t1,$t2,loop

dadd $v0,$zero,$zero
j fin
cumple: daddi $v0,$zero,1
fin:

jr $ra

;SUBRUTINA DE IMPRESION
imprimir:
daddi $t0,$zero,6	;Limpieza
sd $t0,0($s0)

sd $a0,0($s1)		;Direccion del mensaje

daddi $t0,$zero,4	;Impresion de la cadena
sd $t0,0($s0)
jr $ra