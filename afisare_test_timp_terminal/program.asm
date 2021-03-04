.data
	Msg: .asciz "This is the message\n"
.text

.global main

main:
	push $Msg
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80

