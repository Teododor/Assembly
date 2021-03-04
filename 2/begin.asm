.data 
//aici declaram variabilele programului



.text

//de aici incepe codul prorpiu-zis
//definim start ca fiind o eticheta globala reprezentand entry-ul din programul nostru


.globl _start
//echivalentul main-ului



_start:
	mov $1, %eax
	mov $0, %ebx
	int $0x80

//instructiuni
