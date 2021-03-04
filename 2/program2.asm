.data
	x: .long 15
.text

.globl_start
	movl $0,%eax
	movl %eax,x
	movl x,%ebx
	
	mov $1,%eax
	mov $0,%ebx
	int $0x80
_start:
