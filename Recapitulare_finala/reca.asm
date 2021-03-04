.data
	vector: .space 100
	number: .space 4
	index: .space 4
	index_dsp: .space 4
	read_nmb : .space 4
	formatScanf: .asciz "%d "
	formatPrintf: .asciz "%d " 
	
.text

.global main

main:
	push $number
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	lea vector,%edi
	
	loop_read:
		lea vector,%edi
		mov index, %ecx
		cmp %ecx, number
		je finish_read
		
		push $read_nmb
		push $formatScanf
		call scanf
		pop %ebx
		pop %ebx
		
		mov read_nmb, %ebx
		
		movl %ebx,(%edi, %ecx, 4)
		
		incl index
		
		jmp loop_read
	
	finish_read:
		lea vector, %edi
		mov index_dsp, %ecx
		cmp %ecx, number
		je et_exit
		
		mov (%edi,%ecx,4),%ebx
		
		push %ebx
		push $formatPrintf
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		incl index_dsp
		
		jmp finish_read
	
	
et_exit:
	mov $1,%eax
	mov $0,%ebx
	int $0x80
