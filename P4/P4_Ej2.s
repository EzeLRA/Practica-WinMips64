.data
A: .word 1
B: .word 2
.code
ld r1, A(r0)
ld r2, B(r0)
sd r2, A(r0)
sd r1, B(r0)
halt

;a_1:
;A partir de la linea 7 en la instruccion (sd) se produce un atasco
;Debido a que la misma pide un dato que todavia no se encuentra "realizada" en la anterior instruccion
;Osea que en la instruccion anterior el dato para el momento en el que se pide no estaba preparado

;a_2:
;El atasco que se produce es del tipo RAW (Read After Write) ante la situacion que se demuestra anteriormente

;a_3:
;El promedio es de 2,2 ciclos

;b_1:
;Sucede ante el uso de "buffers" que hacen que proceda el programa fluidamente

;b_2:
;El color verde signica que hubo un acceso a memoria para el procedimiento

;b_3:
;El promedio es de 1,8 ciclos