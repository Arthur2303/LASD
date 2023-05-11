; Atribuindo os valores do 7-seg aos registradores
ADDi $s0, $zero, 126
ADDi $s1, $zero, 48
ADDi $s2, $zero, 109
ADDi $s3, $zero, 121
ADDi $s4, $zero, 51
ADDi $s5, $zero, 91
ADDi $s6, $zero, 95
ADDi $s7, $zero, 112
ADDi $t0, $zero, 127
ADDi $t1, $zero, 123
ADDi $t2, $zero, 119
ADDi $t3, $zero, 31
ADDi $t4, $zero, 78
ADDi $t5, $zero, 61
ADDi $t6, $zero, 79
ADDi $t7, $zero, 71

; Salvando os valores dos registradores na memória

SW $s0, 0($zero)
