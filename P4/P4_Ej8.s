.data
op1: .word 2
op2: .word 4
res: .word 0

.code
ld r1,op1(r0)
ld r2,op2(r0)
daddi r3,r3,0

mult: nop
daddi r2,r2,-1 
dadd r3,r3,r1
nop
bnez r2,mult

nop
sd r3,res(r0)
halt