# C�digo assembly necess�rio para a SPRINT8 (Contador de 1's)

addi $s1, $s0, 10	# N�mero de entrada
addi $s2, $s0, 1  	# N�mero que ser� comparado
addi $s4, $s0, 4  	# Quantidade de itera��es 
add  $s5, $s0, $s0 	# Contador de 1 (Sa�da)	 
add $s6, $s0, $s0   	# Contador do loop
loop: 		and $s3, $s1, $s2
		beq $s3, $s0, label
		addi $s5, $s5, 1
label:		add $s2, $s2, $s2
		addi $s6, $s6, 1
		beq $s6, $s4, sai
		j loop
sai:	
