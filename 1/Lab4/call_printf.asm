//call printf
.data
	x.long 14
	formatPrintf: .asciz "Numarul de afisat este: %d %d"

.text


.global main

main:
//printf("Numarul de afisat este: "%d",x)

et_exit:
mov $1,%eax
mov $0,%ebx
int $ox80
