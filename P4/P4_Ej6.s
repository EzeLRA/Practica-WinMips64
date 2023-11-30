.data
A: .word 1
B: .word 2
C: .word 3
D: .word 0
.code
;Asignaciones
ld r1,A(r0)
ld r2,B(r0)
ld r3,C(r0)
daddi r4,r4,0

;Comparaciones
beq r1,r2,fin1
nop
beq r2,r3,fin2
nop
beq r1,r3,fin3
nop
beqz r4,fin

;Saltos
fin1: dadd r4,r4,r1
sd r4,D(r0)
j fin
fin2: dadd r4,r4,r2
sd r4,D(r0)
j fin
fin3: dadd r4,r4,r3
sd r4,D(r0)
j fin
fin:
halt