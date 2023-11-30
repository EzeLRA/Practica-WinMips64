.data
tabla: .byte 3,3,5,4,0
cant: .word 0

.code
daddi $sp,$zero,0x400
daddi $a0,$zero,tabla
jal contarImpares
sd $v0,cant($zero)

halt

contarImpares:
dadd $t1,$zero,$zero ;Contador para retornar a la salida
daddi $sp,$sp,-8 ;Resta la cantidad que voy a reservar en la pila
sd $ra,0($sp) ;Guarda $ra para la vuelta al prog_Principal

loop: lbu $t0,0($a0)
dadd $a1,$zero,$t0
jal ES_IMPAR
beqz $v1,continuar
nop
daddi $t1,$t1,1
continuar:
daddi $a0,$a0,1
bnez $t0,loop

dadd $v0,$zero,$t1 ;Devuelve la cantidad

;Devuelve los datos guardados anteriormente
ld $ra,0($sp)
daddi $sp,$sp,8 ;Devuelve la cantidad que use en la pila
jr $ra


ES_IMPAR:
andi $t2,$a1,1 
dadd $v1,$zero,$zero
nop
beqz $t2,esPar
daddi $v1,$zero,1
esPar:
jr $ra