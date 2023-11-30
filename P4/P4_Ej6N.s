.data
A: .word 2 
B: .word 2
C: .word 2
D: .word 0
.code
ld r1,A($zero)
ld r2,B($zero)
daddi r4,r4,0
ld r3,C($zero)

bne r1,r2,continuar1
daddi r4,r4,1
nop

continuar1: bne r1,r3,continuar2
daddi r4,r4,1
nop

continuar2: bne r2,r1,continuar3
daddi r4,r4,1
nop

continuar3: bne r2,r3,continuar4
daddi r4,r4,1
nop

continuar4: bne r3,r1,continuar5
daddi r4,r4,1
nop

continuar5: bne r3,r2,continuar6
daddi r4,r4,1
nop

nop
continuar6: sd r4,D($zero)
halt