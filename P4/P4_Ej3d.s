.data
A: .word 1
B: .word 3
tabla: .word 0
.code
ld r1, A(r0)
ld r2, B(r0)
daddi r3,r3,0
nop
loop: sd r1,tabla(r3) 
daddi r2,r2,-1
dsll r1,r1,1
daddi r3,r3,8
bnez r2,loop
halt

;En la tabla se almacenan los numeros 1,2,4 correspondientes a los desplazamiento de bits del numero binario inicial 001 = 1
;Resultando 001=1 , 010=2 , 100=4