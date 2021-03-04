.data
	x: .space 4
	y: .space 4
	formatScanf: .asciz "%d %d"  
	formatPrintf: .asciz "%d "

.text


.global main


divisors:
	push %ebp
	mov %esp, %ebp
	mov 8(%ebp), %ecx
	
	push %ebx
	mov $1, %ebx
	
	loopbegin:
	cmp %ebx, %ecx
	je loopend
	mov %ecx, %eax
	div %ebx
		
	cmp $0, %edx
	je display
	
	cont:
	inc %ebx
	jmp loopbegin
	
	display:
		push %ebx
		push $formatPrintf
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		jmp cont
	
	loopend:
		pop %ebx
		pop %ebp
		ret
	
	
cumstomEven:
	push %ebp
	mov %esp, %ebp
	mov 8(%ebp),%eax
	mov 12(%ebp),%ecx
	
	mov $0, %edx
	mull %ecx
	
	mov $10, %ecx
	
	push %ebx
	
	loop:
		cmp $0, %eax
		je finish_loop
		
		mov $0, %edx
		div %ecx
		add %edx, %ebx
		jmp loop
		
	finish_loop:
		mov %ebx, %eax
		mov $2, %ecx
		mov $0, %edx
		div %ecx
		cmp $0, %edx
		je par
		jmp impar
		
	par:
		mov $1,%eax
		pop %ebx
		pop %ebp
		ret
		
	impar:
		mov $0, %eax
		pop %ebx
		pop %ebx
		ret

main:
	lea vector, %edi
	push %ecx
	mov n,%ecx
	inc %ecx
	mov $ecx,m
	mov $0, %ecx
	
	while:
	cmp %ecx,m
	je et_gata
	mov (%edi,%ecx,4),%ebx
	mov (%edi,%ecx,4),nrcurent
	push %ebx
	inc %ecx
	cmp %ecx,n
	jl gata
	mov(%edi,%ecx,4),%ebx
	push %ebx
	call cumstomEven
	pop %ebx
	pop %ebx
	
	inc %ecx
	
	cmp $1, %eax
	je dsp
	jmp while
	
	gata:
	mov $1,%ebx
	jmp saritura
	
	dsp:
	push nrcurent
	push $formatPrintf
	call printf
	pop %ebx
	pop %ebx
	
	push nrcurent
	call divisors
	pop %ebx
	jmp while
	
	et_gata:
	mov $1, %eax
	mov $0, %ebx
	int $0X80
		
	loop:
	pop %ebx
	jmp loop
