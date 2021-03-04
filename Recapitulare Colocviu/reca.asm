.data
	first: .space 4
	second: .space 4
	result : .space 4
	formatScanf : .asciz "%d %d"
	formatPrintf: .asciz "Suma numerelor %d si %d este %d"

.text


.global main


main:
	push $second
	push $first
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx
	
	mov first,%eax
	add %eax,second
	mov second, %eax
	mov %eax, result
	
	mov first, %eax
	sub %eax, second
	
	push result
	push second
	push first
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
et_exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
	
