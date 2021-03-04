.data
	number: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "

.text


.global main

nrcifbinar:
	push %ebp
	mov %esp, %ebp
	
	mov 8(%ebp), %eax
	mov $2, %ecx
	
	push %ebx
	mov $0, %ebx
	
	loopcif:
	
	cmp $0, %eax
	je finish_loop
	
	mov $0, %edx
	div %ecx
	add %edx, %ebx
	
	jmp loopcif
	
	
	finish_loop:
	mov %ebx, %eax
	pop %ebx
	pop %ebp
	ret

main:
	push $number
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push number
	call nrcifbinar
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
	
