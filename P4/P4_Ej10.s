.data
cadena: .asciiz "adbdcdedfdgdhdid"
car: .asciiz "d"
cant: .word 0

.code
daddi r1,r1,0 ;Contador
daddi r2,r2,0 ;Puntero
ld r3,car(r0)

loop: lbu r4,cadena(r2)
bne r3,r4,continuar
nop
daddi r1,r1,1

continuar: beqz r4,fin
nop
daddi  r2,r2,1
j loop

nop
fin: sd r1,cant(r0)
halt