.data
tabla: .word 1,2,3,4,5,6,7,8,9,10
x: .word 5
cant: .word 0
res: .word 0

.code
ld r1,x(r0) ;Registro Comparador
daddi r2,r2,0 ;Registro Desplazador
daddi r3,r3,10 ;Registro Contador
daddi r4,r4,0 ;Registro Indicador
daddi r6,r6,0 ;Registro de cuenta para el resultado(Contador)

loop: ld r5,tabla(r2) ;Registro auxiliar a comparar

;Compara y cuenta si "X > tabla[r2]"
slt r4,r5,r1

;Guarda en cada posicion el resultado de las comparaciones con la tabla
sd r4,res(r2)

daddi r3,r3,-1
daddi r2,r2,8

dadd r6,r6,r4

bnez r3,loop

;Guarda la cantidad comparada
sd r6,cant(r0)

halt