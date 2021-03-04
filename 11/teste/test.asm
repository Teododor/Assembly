.data
	x : .space 4
	y : .space 4
	formatScanf: .asciz "%d %d"
	formatPrintf: .asciz "%d %d"
	formatNewLine: .asciz "\n\n"
	

.text

.global main


main:
	push $y
	push $x
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx
	
	add $1, x
	add $2, y
	
	push y
	push x
	push $formatPrintf
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
	
	add $1, x
	add $2, y
	
	push y
	push x
	push $formatPrintf
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
	
	mov $5, %edi
	cmp $5, $5
	je .text
	
et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
