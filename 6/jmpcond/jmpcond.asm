.data
	a: .word 5 
	b: .word -3
	text1: .asciz "a >= b/n"
	text2: .asciz "a  < b/n"

.text

.globl _start

_start:
	mov a, %eax
	mov b, %ebx
	cmp %eax, %ebx
	jge et
	
	mov $4, %eax
	mov $1, %ebx
	mov $text2, %ecx
	mov $7, %edx
	int $0x80
	
	jmp exit
	
et:
	mov $4, %eax
	mov $1, %ebx
	mov $text1, %ecx
	mov $7, %edx
	int $0x80
	
exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
