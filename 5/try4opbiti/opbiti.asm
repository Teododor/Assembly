.data
 x: .long 15

.text

.globl _start

_start:

	mov x, %eax
	not %eax
	mov %eax,x
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
