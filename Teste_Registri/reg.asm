.data
	formatPrintf: .asciz "%d %d %d %d %d %d %d %d"
	Print: .asciz "%d\n"
	test_value: .space 4	
	
.text

.global main

main:
	mov $1, %eax
	mov $2, %ebx
	mov $3, %ecx
	mov $4, %edx
	//mov $5, %esp
	mov $6, %ebp
	mov $7, %esi
	mov $8, %edi
	
	mov %eax, test_value
	
	push test_value
	push $Print
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	push %edi
	push %esi
	push %ebp
	//push $esp
	push %edx
	push %ecx
	push %ebx
	push %eax
	push $formatPrintf
	call printf
	//pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $1,%eax
	mov $0,%ebx
	int $0x80	
