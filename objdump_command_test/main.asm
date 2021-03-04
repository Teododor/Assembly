.data
	a: .space 4
	formatPrintf: .asciz "%d\n"
.text

.global main

main:
	
	mov $0x100,%eax
	push %eax
	push $formatPrintf
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $42,%eax
	mov %eax,a
	
	push a
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
et_exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
