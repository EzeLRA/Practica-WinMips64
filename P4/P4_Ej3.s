.data
A: .word 1
B: .word 3
.code
ld r1, A(r0)
ld r2, B(r0)
loop: dsll r1,r1,1
daddi r2,r2,-1
bnez r2,loop
halt

; a:
;Se intenta leer el registro 2(r2) para la condicional del salto de "loop"

;El atasco Branch Taken refiere a las instrucciones que entran al ciclo pero se pierde debido a un salto
;En el que tal instruccion sucede en el halt que no se ejecuta por el salto del "loop"

;Tiene un promedio de 1,75 ciclos

; b:
;Se producen los atascos de tipo RAW en las instrucciones dsll y bnez
;Debido a que intentan acceder al valor que todavia no se encuentra escrito o procesado para su lectura
;Sucede en la etapa de Instruction Decoding durante 2 ciclos

;Del mismo modo que los branch taken sucenden a lo largo de 2 ciclos en las partes del "loop"
;Con la diferencia del fordwardin o adelantamiento que lo reduce a 1 ciclo dentro del "loop"

;Tiene un promedio de 2,083 ciclos

 