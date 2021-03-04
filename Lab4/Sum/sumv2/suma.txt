.data
	x: .space 4
	y: .space 4
	formatScanf: .asciz "%d %d"
	formatPrintf: .asciz "Suma numerelor %d si %d este %d\n"
.text

.global main


main:
	//scanf("%d %d", &x, &y)
	pushl $y
	pushl $x
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	popl %ebx
	
	movl x, %eax
	addl y, %eax
	
	//printf ("Suma numerelor %d si %d este %d\n")
	pushl %eax
	pushl y
	pushl x
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
et_exit:
	movl $1, %eax
	movl $0, %ebx
	int  $0x80
