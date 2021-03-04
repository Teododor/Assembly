.data
	nr: .space 10
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "
.text

.global main

puteredoi:

	push %ebp
	mov %esp, %ebp
	
	mov $1, %eax
	mov $2, %ecx
	push %ebx
	mov $0, %ebx
	
	loop:
	cmp %eax,nr
	jle finish_loop
	
	mov $0, %edx
	mull %ecx
	incl %ebx
	jmp loop


	finish_loop:
	mov %ebx,%eax
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
	call puteredoi
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
	xor %ebx, %ebx
	int $0x80
