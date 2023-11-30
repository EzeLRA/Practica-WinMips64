.data
M: .word 5
tabla: .word 2,3,4,5,6,7,9,10
dimL: .word 8
resul: .word 0

.code
ld $a0,M($zero) ;Valor a comparar
daddui $a1,$zero,tabla ;direccion de la tabla
ld $a2,dimL($zero) ;dimension de la tabla
jal mayoresCant
sd $v0,resul($zero)

halt

mayoresCant: 
dadd $t1,$zero,$a0 ;Valor a comparar
dadd $t3,$zero,$a2 ;Dimension de la tabla
daddi $t4,$t4,0 ;Contador

loop: ld $t0,0($a1) ;Valor de la tabla
nop
nop
slt $t5,$t0,$t1 ;Compara
nop
nop
beqz $t5,continuar
daddi $t4,$t4,1 ;Cuenta
continuar:
daddi $t3,$t3,-1 ;Dim de la tabla
daddi $a1,$a1,8 ;Avance de la tabla
nop
bnez $t3,loop

dadd $v0,$zero,$t4
jr $ra
