.data
CONTROL: .word 0x10000
DATA: .word 0x10008
num: .word 0

;numeros
cero: .asciiz "CERO"
uno: .asciiz "UNO"
dos: .asciiz "DOS"
tres: .asciiz "TRES"
cuatro: .asciiz "CUATRO"
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"

.code
lwu $s0,CONTROL($zero)
lwu $s1,DATA($zero)

daddi $a0,$zero,num
jal ingreso

daddi $a0,$zero,num
jal muestra

halt

ingreso:
daddi $t0,$zero,8	;Lectura desde terminal la terminal para leer un digito
sd $t0,0($s0)
lbu $t0,0($s1)

sltiu $t1,$t0,10	;Corrige si la lectura no es un digito
bnez $t1,pasar
daddi $t0,$zero,0
pasar:

sd $t0,0($a0)		;Almacenamiento en num

jr $ra


muestra:
daddi $t0,$zero,6	;Seteo en CONTROl para limpieza
sd $t0,0($s0)

lbu $t0,0($a0)	; $t0 = num

bnez $t0,continuar1		;Evalua 0
daddi $t0,$zero,cero
sd $t0,0($s1)
j imprimir

continuar1: daddi $t2,$zero,1
bne $t0,$t2,continuar2		;Evalua 1
daddi $t0,$zero,uno
sd $t0,0($s1)
j imprimir

continuar2: daddi $t2,$zero,2
bne $t0,$t2,continuar3		;Evalua 2
daddi $t0,$zero,dos
sd $t0,0($s1)
j imprimir

continuar3: daddi $t2,$zero,3
bne $t0,$t2,continuar4		;Evalua 3
daddi $t0,$zero,tres
sd $t0,0($s1)
j imprimir

continuar4: daddi $t2,$zero,4
bne $t0,$t2,continuar5		;Evalua 4
daddi $t0,$zero,cuatro
sd $t0,0($s1)
j imprimir

continuar5: daddi $t2,$zero,5
bne $t0,$t2,continuar6		;Evalua 5
daddi $t0,$zero,cinco
sd $t0,0($s1)
j imprimir

continuar6: daddi $t2,$zero,6
bne $t0,$t2,continuar7		;Evalua 6
daddi $t0,$zero,seis
sd $t0,0($s1)
j imprimir

continuar7: daddi $t2,$zero,7
bne $t0,$t2,continuar8		;Evalua 7
daddi $t0,$zero,siete
sd $t0,0($s1)
j imprimir

continuar8: daddi $t2,$zero,8
bne $t0,$t2,continuar9		;Evalua 8
daddi $t0,$zero,ocho
sd $t0,0($s1)
j imprimir

continuar9: 			;Finaliza por guardar nueve como cadena a imprimir
daddi $t0,$zero,nueve
sd $t0,0($s1)

imprimir:
daddi $t0,$zero,4	;Escritura de cadena
sd $t0,0($s0)

jr $ra