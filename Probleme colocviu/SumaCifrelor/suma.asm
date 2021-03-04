.data
	nr: .space 4
	sumacif: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "

.text


.global main


sum:
	push %ebp
	mov %esp, %ebp
	push %ebx
	
	mov 8(%ebp), %eax
	mov $0, %ecx
	mov $10,%ebx
	
	
	
	loop:
	cmp $0, %eax
	je finish_loop
	
	mov $0, %edx
	div %ebx
	add %edx, %ecx
	
	jmp loop
	
	
	finish_loop:
	mov %ecx,  %eax
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
	call sum
	pop %ebx
	
	
	push %eax
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $1, %eax
	xor %ebx,%ebx
	int $0x80
	
	
	
	

