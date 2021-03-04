.data
	n: .space 4
	x: .space 4
	ind : .space 4
	index_dsp: .space 4
	v: .space 100
	fScanf: .asciz "%d"
	fPrintf: .asciz "%d"
.text

.global main

main:

	pushl $n
	pushl $fScanf
	call scanf
	popl %ebx
	popl %ebx
	
	
	
	read:
		lea v, %edi
		movl index, %ecx
		cmp %ecx,n
		je display
		
		pushl $x
		pushl $fscanf
		call scanf
		popl %ebx
		popl %ebx
		
		movl x, %eax
		movl %eax,(%edi,%ecx,4)
		
		incl index
		
		jmp read
		
	display:
		lea v, %edi
		movl index_dsp, %ecx
		cmp %ecx, n
		je et_exit
		
		movl (%edi,%ecx,4),%eax
		incl index_dsp
		
		pushl %eax
		pushl $fPrintf
		call printf
		popl %ebx
		popl %ebx
		
		pushl $0
		call fflush
		popl %ebx
		
		jmp display
	
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
