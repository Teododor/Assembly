.data
	n: .space 4
	m: .space 4
	i: .space 4
	j: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "
	newLine : .asciz "\n"
.text

.global main

main:
	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
for_et_i:
	movl i, %eax
	cmp %eax, n
	je et_exit
	
for_et_j:
	mov j,%eax
	cmp %eax, m 
	je actualizeaza_i
	
	pushl j
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	incl j
	
	jmp for_et_j
	
	
actualizeaza_i:
	incl i
	pushl $newLine
	call printf
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	jmp for_et_i
	
et_exit:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
