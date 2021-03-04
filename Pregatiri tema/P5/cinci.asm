.data
	matrix : .space 1600
	queue : .space 1600
	visited : .space 1600
	vectorRoles  : .space 400
	maliciousSwitches: .space 400
	columnIndex: .space 4
	lineIndex: .space 4
	n : .space 4
	queueLen: .space 4
	queueIdx: .space 4
	columnIdx: .space 4
	currentNode: .space 4
	copie_n : .space 4
	nrMuchii: .space 4
	index: .space 4
	left : .space 4
	right : .space 4
	dsp : .space 4
	prob3nod1: .space 4
	prob3nod2: .space 4
	sir_caractere: .space 400
	
	copie_eax : .space 4
	copie_rezultat : .space 4
	columnPosition : .space 4
	problemNumber : .space 4
	numberRolesRead: .space 4
	currentIndex: .space 4
	numberMaliciousSwitches : .space 4
	currentNumberBetweenMaliciousSwitches : .space 4  						
	currentMaliciousSwitch : .space 4
	index_current_malicious_switch : .space 4                 						
	index_line_current_malicious_switch: .space 4
	index_column_current_malicious_switch: .space 4
	readRole : .space 4
	indexRoles: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "
	 formatPrintfProblemaCinciSwitchMalitiosDSP: .asciz "switch malitios index %d; "
	formatPrintfProblemaUnuBegin: .asciz "Am inceput problema 1"
	formatPrintfProblemaCinciSwitchMalitios: .asciz "switch malitios index %d: "
	formatPrintfProblemaCinciControllerIndex: .asciz "controller index %d; "
	formatPrintfProblemaCinciHostIndex: .asciz  "host index %d; "
	formatPrintfProblemaSapteHostIndex: .asciz "host index %d; "
	formatPrintfAfisareTest: .asciz "afisare test\n"
	formatPrintfSwitch : .asciz "switch index %d; "
	formatScanfChar: .asciz "%s"
	formatPrintfProblemaZece: .asciz "%s"
	finishCode: .asciz "Codul s-a incheiat"
	literaP : .asciz "p"
	literaA  : .asciz "a"
	ansYes : .asciz "Yes"
	ansNo  : .asciz "No"
	secondwhile : .asciz "am intrat in al doilea while cu valoarea %d \n"
	newLine: .asciz "\n"
	NEWLINE: .asciz "\n"
	
.text

.global main

main:

	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	mov n, %eax
	mov %eax, copie_n
	
	pushl $nrMuchii
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $0, index
	
et_for:
	movl index, %ecx
	cmp %ecx, nrMuchii
	je et_afis_matr
	
	pushl $left
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $right
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl left, %eax
	movl $0, %edx
	mull n
	addl right, %eax
	
	lea matrix, %edi
	movl $1, (%edi, %eax, 4)
	
	movl right, %eax
	movl $0, %edx
	mull n
	addl left, %eax
	
	lea matrix, %edi
	movl $1, (%edi, %eax, 4)
	
	incl index
	jmp et_for
	
et_afis_matr:
	movl $0, lineIndex
	
	//push n
	//push $formatPrintf
	//call printf
	//pop %ebx
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx

for_lines:
	movl lineIndex, %ecx
	cmp %ecx, n
	je et_read_roles
	
	movl $0, columnIndex

for_columns:
	movl columnIndex, %ecx
	cmp %ecx, n
	je cont
	
	movl lineIndex, %eax
	movl $0, %edx
	
	mull n
	
	addl columnIndex, %eax
	
	lea matrix, %edi
	movl (%edi, %eax, 4), %ebx
	
	//pushl %ebx
	//pushl $formatPrintf
	//call printf
	//popl %ebx
	//popl %ebx
	
	//pushl $0
	//call fflush
	//popl %ebx
	
	incl columnIndex
	jmp for_columns

cont:
	//push $newLine
	//call printf
	//popl %ebx
	
	//push $0
	//call fflush
	//popl %ebx
	
	int $0x80
	incl lineIndex
	
	//movl $4, %eax
	//movl $1, %ebx
	//movl $newLine, %ecx
	//movl $2, %edx
	//int $0x80
	//incl lineIndex
	jmp for_lines
	
et_read_roles:
	movl numberRolesRead, %ecx
	cmp %ecx, n
	//je solve
	je et_display_roles
	
	pushl $readRole
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl numberRolesRead, %ecx
	lea vectorRoles, %edi
	movl readRole, %ebx
	movl %ebx, (%edi,%ecx,4)
	
	incl numberRolesRead
	jmp et_read_roles

et_display_roles:
	movl $0, currentIndex
	// lea vectorRoles, %edi
	// movl currentIndex,%eax
	
et_for_display_roles:
	//mov copie_n, %eax
	//mov %eax, n
	movl currentIndex, %eax
	cmp %eax, n
	je solve
	lea vectorRoles, %edi
	movl (%edi, %eax, 4), %edx
	
	//pushl %edx
	//pushl $formatPrintf
	//call printf
	//popl %ebx
	//popl %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	incl currentIndex
	jmp et_for_display_roles
	
solve:
	pushl $problemNumber
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	mov $1, %ecx
	cmp problemNumber, %ecx
	je problem1
	
	mov $2, %ecx
	cmp problemNumber, %ecx
	je problem2
	
	mov $3, %ecx
	cmp problemNumber, %ecx
	je problem3
	jmp et_exit
	
problem1:
	//pushl $formatPrintfProblemaUnuBegin
	//call printf
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
		
	//push $newLine
	//call printf
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	//push $newLine
	//call printf
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	movl $0, currentIndex
	
	
	
	
	
	
	et_for_display_roles_problem1:


	movl currentIndex, %eax
	cmp %eax, n
	je et_solve_problem_1_1
	lea vectorRoles, %edi
	movl (%edi, %eax, 4), %edx
	
	//pushl %edx
	//pushl $formatPrintf
	//call printf
	//popl %ebx
	//popl %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	incl currentIndex
	jmp et_for_display_roles_problem1
	
	
	et_solve_problem_1_1:
		
		//push $formatPrintfAfisareTest
		//call printf
		//pop %ebx
		
		//push $0
		//call fflush
		//pop %ebx
		movl $0, %eax
		mov %eax, currentIndex
		
	et_solve_problem_1:
	
	//push $formatPrintfAfisareTest
	//call printf
	//pop %ebx
		
	//push $0
	//call fflush
	//pop %ebx
	
	movl currentIndex, %eax
	cmp %eax, n
	je et_exit
	lea vectorRoles, %edi
	movl (%edi, %eax, 4), %edx
	
	movl $0, columnPosition
	cmp $3, %edx
	je start_dsp_afis
	
	incl currentIndex
	jmp et_solve_problem_1
	
	start_dsp_afis:
		push currentIndex
	 	push $formatPrintfProblemaCinciSwitchMalitios
	 	call printf
	 	pop %ebx
	 	pop %ebx
	 	
	 	push $0
	 	call fflush
	 	pop %ebx
	 
	start_dsp:
		mov columnPosition , %ebx
		cmp %ebx, n
		je continueLines
		
		lea matrix, %edi
		movl currentIndex,%eax
		movl $0, %edx
		mull n
		add columnPosition, %eax
		
		
		movl (%edi, %eax, 4), %edx
		
		//edx = elementul din matrice de la linia i si coloana j
		
		movl %edx, %ecx
		
		cmp $1, %ecx
		je dsp_if_equal
		//cmp $1, %ecx
		//je material_ajutator
		
		//push %edx
		//push $formatPrintf
		//call printf
		//pop %ebx
		//pop %ebx
		
		//push $0
		//call fflush
		//pop %ebx
		
		incl columnPosition
		jmp start_dsp
		
	//material_ajutator:
		//push columnPosition
		//push $formatPrintf
		//call printf
		//pop %ebx
		//pop %ebx
		
		//push $0
		//call fflush
		//pop %ebx
		//incl columnPosition
		//jmp start_dsp
	
	dsp_if_equal:
		lea vectorRoles, %esi
		movl columnPosition,%ecx
		movl (%esi,%ecx,4),%edx
		
		//push %edx
		//push $formatPrintf
		//call printf
		//pop %ebx
		//pop %ebx
		
		//push $0
		//call fflush
		//pop %ebx
		
		//incl columnPosition
		//jmp start_dsp
		
		cmp $1, %edx
		je afisare_problema_1_host
		cmp $2, %edx
		je afisare_problema_1_switch
		cmp $3, %edx
		je afisare_problema_1_switch_malitios_rezultat
		cmp $4, %edx
		je afisare_problema_1_controller_logic
		
	afisare_problema_1_host:
		push columnPosition
		push $formatPrintfProblemaCinciHostIndex
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		incl columnPosition
		jmp start_dsp
		
		
	afisare_problema_1_switch:
		push columnPosition
		push $formatPrintfSwitch
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		incl columnPosition
		jmp start_dsp
		
	afisare_problema_1_switch_malitios_rezultat:
		push columnPosition
		push $formatPrintfProblemaCinciSwitchMalitiosDSP
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		incl columnPosition
		jmp start_dsp
	afisare_problema_1_controller_logic:
		push columnPosition
		push $formatPrintfProblemaCinciControllerIndex
		call printf
		pop %ebx
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		incl columnPosition
		jmp start_dsp
		
		
	continueLines:
		push $newLine
		call printf
		pop %ebx
		
		push $0
		call fflush
		pop %ebx
		
		incl currentIndex
		jmp et_solve_problem_1	
	
	//incl currentIndex
	//jmp et_solve_problem_1
	

		
	

problem2:
	mov $1, %eax
	mov %eax , queueLen     
	
	lea visited, %edi
	mov $0, %ecx
	movl $1, (%edi, %ecx,4)  
	
	
	
	label2:
	
	mov queueLen, %eax
	cmp queueIdx, %eax
	je finish_both_whiles
	
	lea queue, %edi
	mov queueIdx, %ecx
	mov (%edi,%ecx,4), %edx
	mov %edx, currentNode
	
	incl queueIdx
	
	lea vectorRoles, %esi
	mov currentNode,%ecx
	mov (%esi,%ecx,4),%ebx
	
	//cmp $0, $ebx
	//je start_2nd_while_22
	
	cmp $2, %ebx
	je start_2nd_while_22
	
	cmp $3, %ebx
	je start_2nd_while_22
	
	cmp $4, %ebx
	je start_2nd_while_22
	
	push currentNode
	push $formatPrintfProblemaSapteHostIndex
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	
	start_2nd_while_22:
	

	
	mov $0, %eax
	mov %eax, columnIndex
	
	
	
	
	loop2ndwhile:
	start_2nd_while:
	
	incl columnIndex
	//push columnIndex
	//push $secondwhile
	//call printf
	//pop %ebx
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	
	mov columnIndex, %eax
	cmp n, %eax
	je label2
	
	
	lea matrix, %edi
	movl $0, %edx
	movl currentNode, %eax
	mull n
	
	
	add columnIndex,%eax
	movl (%edi, %eax, 4) , %ebx
	
	cmp $0, %ebx
	je loop2ndwhile
	
	lea visited, %esi
	movl columnIndex, %eax
	movl (%esi, %eax,4) , %ebx
	
	cmp $1, %ebx
	je loop2ndwhile
	
	lea queue, %edi
	movl queueLen, %eax
	movl columnIndex, %ebx
	movl %ebx, (%edi, %eax, 4)
	incl queueLen
	
	
	movl columnIndex, %eax
	movl $1, (%esi,%eax,4)
	
	//incl columnIndex
	jmp loop2ndwhile
	
	
	//prim_if:
		//add $1, columnIndex
		//jmp loop2ndwhile
	
	
	finish_both_whiles:
	
	push $newLine
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	mov $0, %ecx
	mov %ecx, currentIndex
	
	
	
	start_for:
	
	lea visited, %esi
	mov currentIndex, %ecx
	cmp n, %ecx
	je finish_for 
	incl currentIndex
	movl (%esi, %ecx,4), %edx
	cmp $0, %edx
	je verifica_daca_e_host
	jmp start_for
	
	
	verifica_daca_e_host:
	
	lea vectorRoles, %edi
	movl (%edi,%ecx,4),%edx
	cmp $1,%edx
	jne start_for
	
	jmp afis_NO
	
	
	finish_for:
	push $ansYes
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	
	jmp et_exit
	

problem3:

	push $prob3nod1
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push $prob3nod2
	push $formatScanf
	call scanf
	pop %ebx
	pop %ebx
	
	push $sir_caractere
	push $formatScanfChar
	call scanf
	pop %ebx
	pop %ebx
	

	
	//push $sir_caractere
	//push $formatScanfChar
	//call printf
	//pop %ebx
	//pop %ebx	

	//push $0
	//call fflush
	//pop %ebx
	
	//currentIndex
	
	mov $0, %eax
	mov %eax, currentIndex
	
	jmp et_for_p3_viziteaza
	
	continue_for_p3:
	mov $1, %ebx
	lea visited, %esi
	mov %ebx, (%esi,%eax,4) 
	
	
	et_for_p3_viziteaza:
	
	mov currentIndex, %eax
	cmp %eax, n
	je finished_for
	
	lea vectorRoles, %edi
	lea visited, %esi
	mov currentIndex, %ecx
	incl currentIndex
	
	mov (%edi, %ecx,4), %edx
	cmp $3, %edx
	je continue_for_p3
	
	jmp et_for_p3_viziteaza
	
	finished_for:
	
	//push $formatPrintfAfisareTest
	//call printf
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	mov $0, %eax
	mov %eax, currentIndex
	
	afisare_visited:
	
	lea visited, %edi
	mov currentIndex, %eax
	cmp %eax, n
	je finished_afisare_visited
	mov (%edi, %eax, 4) , %edx
	incl currentIndex
	
	//push %edx
	//push $formatPrintf
	//call printf
	//pop %ebx
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	jmp afisare_visited
	
	finished_afisare_visited:
	//jmp et_exit
	
	
	lea queue, %edi
	mov $0, %eax
	mov prob3nod1, %ebx
	mov %ebx, (%edi,%eax,4)
	
	mov $0, %eax
	mov %eax, queueIdx
	mov $1, %eax
	mov %eax, queueLen
	
	lea visited, %esi
	mov prob3nod1,%ebx
	mov $1, %ecx
	mov %ecx ,(%esi,%ebx,4)
	
	
	
	
	
	
	
	
	label2_3:
	
	mov queueLen, %eax
	cmp queueIdx, %eax
	je finish_both_whiles_3
	
	lea queue, %edi
	mov queueIdx, %ecx
	mov (%edi,%ecx,4), %edx
	mov %edx, currentNode
	
	incl queueIdx
	
	lea vectorRoles, %esi
	mov currentNode,%ecx
	mov (%esi,%ecx,4),%ebx
	
	//cmp $0, $ebx
	//je start_2nd_while_22_3
	
	cmp $2, %ebx
	je start_2nd_while_22_3
	
	cmp $3, %ebx
	je start_2nd_while_22_3
	
	cmp $4, %ebx
	je start_2nd_while_22_3
	
	//push currentNode
	//push $formatPrintfProblemaSapteHostIndex
	//call printf
	//pop %ebx
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	
	start_2nd_while_22_3:
	

	
	mov $0, %eax
	decl %eax
	mov %eax, columnIndex
	
	
	
	
	loop2ndwhile_3:
	start_2nd_while_3:
	
	incl columnIndex
	//push columnIndex
	//push $secondwhile
	//call printf
	//pop %ebx
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	
	mov columnIndex, %eax
	cmp n, %eax
	je label2_3
	
	
	lea matrix, %edi
	movl $0, %edx
	movl currentNode, %eax
	mull n
	
	
	add columnIndex,%eax
	movl (%edi, %eax, 4) , %ebx
	
	cmp $0, %ebx
	je loop2ndwhile_3
	
	lea visited, %esi
	movl columnIndex, %eax
	movl (%esi, %eax,4) , %ebx
	
	cmp $1, %ebx
	je loop2ndwhile_3
	
	lea queue, %edi
	movl queueLen, %eax
	movl columnIndex, %ebx
	movl %ebx, (%edi, %eax, 4)
	incl queueLen
	
	
	movl columnIndex, %eax
	movl $1, (%esi,%eax,4)
	
	//incl columnIndex
	jmp loop2ndwhile_3
	
	
	//prim_if:
		//add $1, columnIndex
		//jmp loop2ndwhile
	
	
	finish_both_whiles_3:
	
	//push $newLine
	//call printf
	//pop %ebx
	
	//push $0
	//call fflush
	/pop %ebx
	
	mov $0, %ecx
	mov %ecx, currentIndex
	
	
	
	
	//mai afisez inca o data visited

	
	//push $newLine
	//call scanf
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	
	afisare_visited_2:
	
	lea visited, %edi
	mov currentIndex, %eax
	cmp %eax, n
	je finished_afisare_visited_2
	mov (%edi, %eax, 4) , %edx
	incl currentIndex
	
	//push %edx
	//push $formatPrintf
	//call printf
	//pop %ebx
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	jmp afisare_visited_2
	
	finished_afisare_visited_2:
	//jmp et_exit
	
	lea visited, %edi
	movl prob3nod2, %ecx
	mov (%edi,%ecx,4),%edx
	
	cmp $0,%edx
	je modif
	
	jmp afisare_problema_10
	
	modif:
		lea sir_caractere, %edi
		movl $0, %ecx
		
	et_for_cerinta_3_final:
	
	
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je afisare_problema_10
	
	//mov literaP,%ah
	//cmp %ah,%al
			mov $10, %ah
		sub %ah,%al
	cmp literaA, %al
	jl adunamaimic10
	
	movb %al, (%edi, %ecx, 1)
	addl $1, %ecx
	
	
	jmp et_for_cerinta_3_final
	
	adunamaimic10:
		mov $26, %ah
		add %ah,%al
		movb %al, (%edi,%ecx,1)
		addl $1,%ecx
		jmp et_for_cerinta_3_final
		
	//scademaimare15:
	//	mov $10, %ah
	//	sub %ah,%al
	//	movb %al, (%edi, %ecx,1)
	//	addl $1, %ecx
	//	jmp et_for_cerinta_3_final
		
		
	afisare_problema_10:
	lea sir_caractere,%edi
	push %edi
	push $formatPrintfProblemaZece
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
	jmp et_exit
	
	
	

afis_NO:
	push $ansNo
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
et_exit:
	//pushl $finishCode
	//call printf
	//pop %ebx
	
	//push $0
	//call fflush
	//pop %ebx
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80

