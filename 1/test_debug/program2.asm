.data
x: .long 15
.text

.globl _start

_start:
	mov $0, %eax
	mov %eax, x
	mov x, %ebx
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
	


