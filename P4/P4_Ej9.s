.data
A: .word 5
X: .word 2
Y: .word 1

.code
ld r2,X(r0)
ld r1,A(r0)
ld r3,Y(r0)

while: beqz r1,fin
dadd r2,r2,r3
daddi r1,r1,-1
j while

nop
fin: halt