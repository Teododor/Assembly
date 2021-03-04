.data

	matrix: .long 10, 20, 30, 40
		.long 50, 60, 70, 80
		.long 90, 100, 110, 120
		
	lines: .long 3
	columns: .long 4
	
	columnIndex: .space 4
	lineIndex: .space 4
	
	formatPrintf: .asciz "%d"
	newLine: .asciz "\n"
	
.text

.global main

main:
	lea matrix, %edi
	
for_lines:
	
	mov lineIndex,%ecx
	cmp %ecx, lines
	je et_exit
	
	mov $0, columnIndex
	
	for_columns:
	
	mov columnIndex,%ecx
	cmp %ecx, columns
	je continue
	
	mov lineIndex, %eax
	mov $0, %edx
	mull columns
