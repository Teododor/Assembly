// suma a doua numere prin intermediul unei proceduri

.data
	x: .long 15
	y: .long 13
	z: .space 4
.text

.global main

suma:
	//%esp : ( <adr intoarcere>) (x)(y)
	//aplicat conventiile
	//1. punem %ebp pe stiva
	//2. il facem pointer in cadrul de apel
	pushl %ebp
	// %esp:(%ebp v) (<adr introacere>) (x)(y)
	movl %esp, %ebp
	//esp : %ebp :(%ebp v) (<adr intoarcere>) (x)(y)
	movl 8(%ebp), %eax
	// in momentul aceasta %eax contine valoarea lui x
	movl 12(%ebp), %ecx
	// in momentul aceasta, %ecx contine valoarea lui y
	// trebuie sa calculez %eax = x+y =%eax+%ecx
	movl %ecx, %eax
	//in acest moment, %eax-ul contine rezultatul
	//trebuie sa fac o restaurare a cadrului de apel
	popl %ebp
	ret

main:
	//vreau sa apelez suma(x,y)
	pushl y
	pushl x
	call suma
	popl %ebx
	popl %ebx
	//fac oiok %ebx sau in oricare alt registru care nu afecteaza programul
	//in cazul curent, nu pot face popl %eax
	// pt ca in %eax stocheaz suma celor doua numere (x+y+
	
	movl %eax,z
	
et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
