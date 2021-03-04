.data
	i: .space 4
	j: .space 4
	n: .space 4
	m: .space 4
	formatScanf: .asciz "%d %d"
	formatPrintfMN : .asciz "%d %d"
	formatPrintf   : .asciz "%d "
	formatNewLine  : .asciz "\n\n"
.text

.global main

main:
	push $n
	push $m
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx
	
	push n
	push m
	push $formatPrintfMN
	call printf
	pop %ebx
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	push $formatNewLine
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $0, %eax
	
et_for_i:
	mov i , %ecx
	cmp %ecx, n
	je et_exit
	
	mov %ecx , j
	
	et_for_j :
		mov j, %ecx
		cmp %ecx, m
		je continue_i
		
		push %ecx
		push $formatPrintf
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		inc j
		jmp et_for_j
		
continue_i :
	inc i
	jmp et_for_i
	
et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
