.data
cad1: .asciiz "nombre"
cad2: .asciiz "nom"
pos: .word 0

.code
daddi $a0,$a0,cad1
daddi $a1,$a1,cad2
jal igualesCad
sd $v0,pos($zero)
halt

igualesCad:
daddi $t3,$t3,1 ;Contador

loop:
lbu $t0,0($a0) ;Carga la letra de la cadena
lbu $t1,0($a1) ;Carga la letra de la cadena

bne $t0,$t1,salir ;(Cad1 <> Cad2)
beqz $t0,salir1	  ;(Cad1 = 0)
beqz $t1,salir1	  ;(Cad2 = 0)

daddi $t3,$t3,1
daddi $a0,$a0,1
daddi $a1,$a1,1
j loop

salir: dadd $v0,$zero,$t3
j fin

salir1: bne $t0,$t1,salir
daddi $v0,$zero,-1

fin:
jr $ra
