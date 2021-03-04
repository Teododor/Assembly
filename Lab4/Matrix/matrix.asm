.data
	matrix: .space 1600
	columnIndex: .space 4
	lineIndex: .space 4
	n: .space 4
	nrMuchiiL .space 4
	index: .space 4
	left: .space 4
	right: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "
	newLine : .asciz "\n"

.text

.global main

main: 
	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $nrMuchii
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

//for (int index=0; index< nrMuchii; index++)
	{
		scanf("%d", &Left);
		scanf("%d", &right);
		matrix[left][right]=1;
	}
//

	movl $0, index
	
et_for:
	
