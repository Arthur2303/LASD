# Código assembly necessário para a SPRINT8 (Contador de 1's)

addi $s1, $s0, 10	# Número de entrada
addi $s2, $s0, 1  	# Número que será comparado
addi $s4, $s0, 4  	# Quantidade de iterações 
add  $s5, $s0, $s0 	# Contador de 1 (Saída)	 
add $s6, $s0, $s0   	# Contador do loop
loop: 		and $s3, $s1, $s2
		beq $s3, $s0, label
		addi $s5, $s5, 1
label:		add $s2, $s2, $s2
		addi $s6, $s6, 1
		beq $s6, $s4, sai
		j loop
sai:	
