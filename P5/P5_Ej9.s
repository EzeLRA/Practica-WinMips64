.data
vocalesMins: .asciiz "aeiou"
vocalesMayus: .asciiz "AEIOU"
caracter: .ascii "U"
res: .word 0

.code
ld $a0,caracter($zero)
jal ES_VOCAL
sd $v0,res($zero)
halt

ES_VOCAL:
dadd $t0,$zero,$a0 ;caracter
dadd $t1,$zero,$zero ;puntero
daddi $v0,$v0,0 ;Salida

loop1: lbu $t2,vocalesMins($t1)
nop
beq $t0,$t2,cumple
daddi $t1,$t1,1
bnez $t2,loop1

dadd $t1,$zero,$zero ;puntero
loop2: lbu $t2,vocalesMayus($t1)
beq $t0,$t2,cumple
daddi $t1,$t1,1
bnez $t2,loop2

j fin

cumple: daddi $v0,$v0,1
fin:
jr $ra