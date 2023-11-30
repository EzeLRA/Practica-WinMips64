.data
Base: .double 5.85
Altura: .double 13.47
Division: .double 2.0
Superficie: .double 0.0

.code
l.d f1,Base($zero)
l.d f2,Altura($zero)
l.d f4,Division($zero)
mul.d f3,f1,f2
div.d f3,f3,f4
s.d f3,Superficie($zero)
halt
