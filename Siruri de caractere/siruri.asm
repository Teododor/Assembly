// Parcurgere sir caractere; determinare lungime si modificare

.data

	str: .asciz "Sir"
	len : .space 4
	dsp_str : .space
.text

.global main

main:
	lea str, %edi
	movl $0, %ecx
et_for:
	movb (%edi, %ecx, 1) ,%al
	cmp $0, %al
	je et_exit
	
	addb $1, %al
	movb %al, (%edi, %ecx, 1)
	
	addl $1, %ecx
	jmp et_for
	
et_exit:
	push $str
	push $dsp_str
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
	
