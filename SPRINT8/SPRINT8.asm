# C�digo assembly necess�rio para a SPRINT8. OBS: Feito no MARS 4.5

addi $s1, $zero, 9  # N�mero de entrada
addi $s2, $zero, 1  # N�mero que ser� comparado
addi $s4, $zero, 4  # Quantidade de itera��es / N�mero m�ximo ap�s os deslocamentos
add $s5, $zero, $zero # Contador de 1
add $s6, $zero, 1 

loop: 	and $s3, $s1, $s2
	beq $s3,$zero, label
	addi $s5, $s5, $s1
label:	add $s2, $s2, $s2
	sub $s4, $s4, $s6
	beq $zero, $s4, loop
	