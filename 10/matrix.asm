.data
	matrix:  .long 10,20,30,40
		 .long 50,60,70,80
		 .long 90,100,110,120
	lines: .long 3
	columns: .long 4
	
	columnIndex: .space 4
	lineIndex: .space 4
	formatPrintf: .asciz "%d "
	newLine: .asciz "\n"

.text

.global main

main: 
	lea matrix, %edi
	movl $0, lineIndex

for_lines:
	movl lineIndex, %ecx
	cmp %ecx, lines
	je et_exit
	
	movl $0, columnIndex

for_columns:
	movl columnIndex,%ecx
	cmp %ecx, columns
	je continue
	
	movl lineIndex, %eax 
	movl $0, %edx
	mull columns
	
	addl columnIndex, %eax
	
	movl (%edi,%eax,4), %ebx
	
	pushl %ebx
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	incl columnIndex
	jmp for_lines
	
continue:
	movl $4, %eax
	movl $1, %ebx
	movl $newLine, %ecx
	movl $2, %edx
	int $0x80
	
	incl lineIndex
	jmp for_lines
	
et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
	

