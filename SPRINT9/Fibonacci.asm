addi $s1, $s0, 2
add $s2, $s0, $s0
addi $s3, $s0, 1 
add $s4, $s0, $s0
beq $s1, $s0, label1
beq $s1, $s3, label2
loop:  	add $s2, $s3, $s0
        add $s3, $s3, $s2
        addi $s4, $s4, 1
        beq $s4, $s1, sai
        j loop
label1: $s0, FF($0)
label2: $s1, FF($0)
sai:
