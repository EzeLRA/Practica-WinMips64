.data
coorX: .byte 0 ; coordenada X de un punto
coorY: .byte 0 ; coordenada Y de un punto
color: .byte 0,0,0, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, CONTROL($zero) ; $s0 = dirección de CONTROL
lwu $s1, DATA($zero) ; $s1 = dirección de DATA

daddi $t0,$zero,8 ; $t0 = 8 -> función 8: Lectura de numero
sd $t0,0($s0)

lbu $t0,0($s1)
sb $t0,coorX($zero)

daddi $t0, $zero, 6 ; $t0 = 6 -> función 6: limpia la terminal 
sd $t0, 0($s0) ; CONTROL recibe 6 

daddi $t0,$zero,8 ; $t0 = 8 -> función 8: Lectura de numero
sd $t0,0($s0)

lbu $t0,0($s1)
sb $t0,coorY($zero)

daddi $t0, $zero, 6 ; $t0 = 6 -> función 6: limpia la terminal 
sd $t0, 0($s0) ; CONTROL recibe 6 

dadd $t3,$zero,$zero
daddi $t4,$zero,3
loopColor: beqz $t4,continuar

daddi $t0,$zero,8 ; $t0 = 8 -> función 8: Lectura de numero
sd $t0,0($s0)

lbu $t0,0($s1)
sb $t0,color($t3)

daddi $t0, $zero, 6 ; $t0 = 6 -> función 6: limpia la terminal 
sd $t0, 0($s0) ; CONTROL recibe 6 

daddi $t3,$t3,1
daddi $t4,$t4,-1

j loopColor
continuar:

daddi $t0, $zero, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($s0) ; CONTROL recibe 7 y limpia la pantalla gráfica

lbu $t0,coorX($zero)
sb $t0,5($s1)

lbu $t0,coorY($zero)
sb $t0,4($s1)

lwu $t0,color($zero)
sw $t0,0($s1)

daddi $t0, $zero, 5 ; $t0 = 5 -> función 5: salida gráfica
sd $t0, 0($s0) ; CONTROL recibe 5 y produce el dibujo del punto
halt