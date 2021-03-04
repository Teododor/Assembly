.data
	vector: .space 4
	nr: .space 4
	index: .space 4
	read_number: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d"
	
.text

.global main

main:

	push $nr
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	
	push nr
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	
et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
