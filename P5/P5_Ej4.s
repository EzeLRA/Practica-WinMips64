.data
peso: .double 75.7
altura: .double 1.53
IMC: .double 0.0
estado: .word 0

infrapeso: .double 18.5
normal: .double 25.0
sobrepeso: .double 30.0

.code
l.d f1,peso($zero)
l.d f2,altura($zero)
daddi r1,r1,0

mul.d f2,f2,f2
nop
div.d f3,f1,f2
nop

;Evalua IMC < 18,5
l.d f4,infrapeso($zero)
c.lt.d f3,f4
bc1f continuar1
daddi r1,r1,1
sd r1,estado($zero)
j fin

;Evalua 18,5 <= IMC < 25
continuar1:
l.d f4,normal($zero)
c.lt.d f3,f4
bc1f continuar2
daddi r1,r1,2
sd r1,estado($zero)
j fin

;Evalua 25 <= IMC < 30
continuar2:
l.d f4,sobrepeso($zero)
c.lt.d f3,f4
bc1f continuar3
daddi r1,r1,3
sd r1,estado($zero)
j fin

;Evalua IMC >= 30
continuar3:
c.le.d f4,f3
bc1f fin
daddi r1,r1,4
sd r1,estado($zero)

fin:
s.d f3,IMC($zero)
nop
halt