.data
op1: .word 0
op2: .word 0
res: .word 0
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
lwu $s0,CONTROL($zero)
lwu $s1,DATA($zero)

daddi $a0,$zero,op1 
jal ingreso
daddi $a0,$zero,op2 
jal ingreso

ld $a0,op1($zero)
ld $a1,op2($zero)
jal suma
sd $v0,res($zero)


ld $a0,res($zero)
jal resultado

halt



ingreso:
daddi $t0,$zero,8	;Lectura desde terminal la terminal para leer un digito
sd $t0,0($s0)
lbu $t0,0($s1)

sltiu $t1,$t0,10	;Corrige si la lectura no es un digito
bnez $t1,saltar
daddi $t0,$zero,0
saltar:

sb $t0,0($a0)		;Almacenamiento en la direccion del argumento pasado

jr $ra

suma:
dadd $v0,$a0,$a1
jr $ra


resultado:
daddi $t0,$zero,6	;Limpieza de la terminal
sd $t0,0($s0)

sd $a0,0($s1)		;Guarda el resultado en DATA

daddi $t0,$zero,2	;Escritura de numero sin signo
sd $t0,0($s0)

jr $ra
