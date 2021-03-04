.data
	text1: .asciz "text1\n"
	text2: .asciz "text2\n"
	
.text

.globl _start


_start:
	jmp et2
	
	et1:
	
	mov $4,%eax
	mov $1,%ebx
	mov $text1, %ecx
	mov $7, %edx
	int $0x80
	
et2:
	mov $4, %eax
	mov $1, %ebx
	mov $text2, %ecx
	mov $7, %edx
	int $0x80
	
	jmp et1
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
