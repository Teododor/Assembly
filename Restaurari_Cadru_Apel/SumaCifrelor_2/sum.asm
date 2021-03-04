.data
	nr: .space 4
	sum: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz  "%d "
	
.text

.global main

sum_cif:
	push %ebp
	mov %esp, %ebp
	push %ebx
	
	mov nr, %eax
	mov $0, %ebx
	mov $10, %ecx
	
	
	
	et_while:
	cmp $0, %eax
	je finish_while
	
	mov $0, %edx
	div %ecx
	add %edx, %ebx
	
	jmp et_while
	
	
	finish_while:
	mov %ebx, %eax
	
	pop %ebx
	pop %ebp
	
	ret
	

main:
	push $nr
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push nr
	call sum_cif
	pop %ebx
	
	push %eax
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $1,%eax
	mov $0,%ebx
	int $0x80
	
	
