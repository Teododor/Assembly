.data
	x: .space 4
	y: .space 4
	z: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "

.text

.global main


suma:
	push %ebp
	mov % esp, %ebp
	mov 8(%ebp), %eax
	mov 12(%ebp), %ecx
	add %ecx, %eax
	pop %ebp
	ret
main:
	push $x
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push $y
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push y
	push x
	call suma
	pop %ebx
	pop %ebx
	
	mov %eax, z
	
	push z
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
