.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
caracterFin: .ascii "0"
caracter: .asciiz "" 

.text
lwu $s0, DATA($zero) ; $s0 = dirección de DATA
lwu $s1, CONTROL($zero) ; $s1 = dirección de CONTROL
dadd $t1,$zero,$zero ; Puntero de avance
lbu $t2,caracterFin($zero) ; Caracter fin de lectura


loop:

daddi $t0, $zero, 9 ; $t0 = 9 -> función 9: lectura de caracter
sd $t0, 0($s1) ; CONTROL recibe 9

lbu $t0,0($s0) ;Extraigo el dato extraido en un registro
beq $t0,$t2,fin

sb $t0,caracter($t1) ;Almaceno la lectura en "caracter"

daddi $t1,$t1,1

j loop

fin:
daddi $t0,$zero,caracter ;Direccion de "caracter"
sd $t0, 0($s0) ; DATA recibe la direccion de caracter

daddi $t0, $zero, 6 ; $t0 = 6 -> función 6: limpia la pantalla
sd $t0, 0($s1) ; CONTROL recibe 6

daddi $t0, $zero, 4 ; $t0 = 4 -> función 4: imprime el caracter almacenado en "caracter"
sd $t0, 0($s1) ; CONTROL recibe 4

halt