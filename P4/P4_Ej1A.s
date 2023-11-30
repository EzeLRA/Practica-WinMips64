.data
A: .word16 2 ;r1
B: .word16 3 ;r2
.code
ld r1,A(r0)
ld r2,B(r0)
dadd r1,r2,r0 ;Guardara en R1 lo que hay en R3
;Simulando la instruccion en MSX88 MOV R1,R2
halt