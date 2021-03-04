.data
	vector: .space 100
	x: .space 4
	n: .space 4
	value: .space 4
	index: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "

.text

.global main

main:

	push $n
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	loop_read:
	mov index, %eax
	cmp %eax, n
	je finish_read
	
	push $x
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	lea vector,%edi
	mov index, %eax
	mov x, %ebx
	mov %ebx,(%edi,%eax,4)
	
	incl index
	jmp loop_read
	
	finish_read:
	mov $0,%eax
	mov %eax, index
	
	loop_write:
	mov index,%ecx
	cmp %ecx, n
	je et_exit
	
	mov index, %eax
	lea vector, %edi
	mov (%edi,%eax,4),%ebx
	mov %ebx, value
	
	push value
	push $formatPrintf
	call printf
	pop %ebx 
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	incl index
	jmp loop_write

et_exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
	
