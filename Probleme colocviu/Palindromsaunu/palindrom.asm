.data
	number: .space 4
	rasturnat: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "

.text


.global main

e_palindrom:
	push %ebp
	mov %esp, %ebp
	mov 8(%ebp), %eax
	mov $10, %ecx
	
	push %ebx
	
	loop:
		mov $0, %edx
		div %ecx
		
		push %eax
		mov %edx, %ebx
		
		mov $0, %eax
		
		mov $0, %edx
		mull %ecx
		

main:
	push $number
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push number
	call e_palindrom
	pop %ebx
