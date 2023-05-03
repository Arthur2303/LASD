; Desloca o valor do registrador $s1 4 bits para a esquerda

ADDI $s1, $zero, 202 ; 11001010 ou  0xCA
ADD $s1, $s1, $s1
ADD $s3, $s2, $s2
ADD $s4, $s3, $s3
ADD $s5, $s4, $s4 ; 1010000 ou  0xA0
