.data
	number: .long 26
	textprime: .asciz "PrimeNumber\n"
	textcomposite: .asciz "CompositeNumber\n"

.text



.globl _start



_start:
	mov $2, %eax
	mov number,%ebx
	cmp %ebx,%eax
	je etprime
	cmp %ebx,%eax
	jg etcomposite
	
	mov $2, %ecx
	mov %ebx,%eax
	div %ecx
	mov $0, %ecx
	cmp %ecx,%edx
	je etcomposite
	
	jmp et_for
	

et_finish_code:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
	
etprime:
	mov $4, %eax
	mov $1, %ebx
	mov $textprime, %ecx
	mov $12, %edx
	int $0x80
	jmp et_finish_code
	

	
etcomposite:
	mov $4, %eax
	mov $1, %ebx
	mov $textcomposite, %ecx
	mov $16, %edx
	int $0x80
	jmp et_finish_code
	
et_for:
	mov $3, %ecx
	mov number, %eax
	mov $2, %ebx
	div %ebx
	
	et_loop:
		cmp %ecx,%eax
		
	
		
	
