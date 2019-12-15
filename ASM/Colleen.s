; Un commentaire

section .data
hello:
	.string db "; Un commentaire%2$c%2$csection .data%2$chello:%2$c%4$c.string db %3$c%1$s%3$c, 0%2$c%2$csection .text%2$c%4$cglobal start%2$%4$ccglobal _main%2$%4$ccextern _printf%2$c%2$cstart:%2$c%4$ccall _main%2$c%4$cret%2$c%2$c_main:%2$c%4$c; Un commentaire%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$clea rdi, [rel hello.string]%2$c%4$clea rsi, [rel hello.string]%2$c%4$cmov rdx, 10%2$cmov rcx, 34%2$%4$cmov r8, 9%2$c%4$cccall _printf%2$c%4$cleave%2$c%4$cret%2$c", 0

section .text
	global start
	global _main
	extern _printf

start:
	call _main
	ret

_main:
	; Un commentaire
	push rbp
	mov rbp, rsp
	lea rdi, [rel hello.string]
	lea rsi, [rel hello.string]
	mov rdx, 10
	mov rcx, 34
	mov r8, 9
	call _printf
	leave
	ret
