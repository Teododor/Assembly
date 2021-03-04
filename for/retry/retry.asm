.data
	n : .space 4
	m : .space 4
	formatPrintf: .asciz "%d"
	formatScanf:  .asciz "%d"
	newLine    :  .asciz "\n"
.text

.global main


main:
	push $n
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push n
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	push $m
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	
	push m
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
