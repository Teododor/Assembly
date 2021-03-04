.data
	i: .long 0
	j: .long 0
	n: .space 4
	m: .space 4
	formatScanf: .asciz "%d %d"
	formatPrintf: .asciz "%d "
	formatPrintfMN: .asciz "%d %d"
	formatNewLine: .asciz "\n"
	
.text

.global main

main:
	push $m
	push $n
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx
	
	push m
	push n
	push $formatPrintfMN
	call printf
	pop %ebx
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	
	
forI:
	add $1, i
	mov n, %ebx
	cmp n, %ebx



forJ:

et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80	
