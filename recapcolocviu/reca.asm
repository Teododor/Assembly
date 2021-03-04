.data
	vector : .space 400
	N: .space 4
	value: .space 4
	index: .space 4
	formatScanf : .asciz "%d"
	formatPrintf : .asciz "%d"
	
.text

.global main

main:
	push $N
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	et_for:
		push $value
		push $formatScanf
		call scanf
		pop %ebx
		pop %ebx
		
		mov index, %ecx
		mov value, %ebx
		
		lea vector, %edi
		
		mov %ebx,(%edi,%ecx,4)
		inc index
		cmp index,N
		je finish_for
		jmp et_for
		
	finish_for:
		mov $0, index
	
		et_display:
			mov index,%eax
			lea vectr, %edi
			mov(%edi,%eax,4),%edx
			
			push %edx
			push $formatPrintf
			call printf
			pop %ebx
			pop %ebx
			
			push $0
			call fflush
			pop %ebx
			
			
			inc index
			cmp index,N
			je et_exit
			jmp et_display
		
	
	
et_exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
