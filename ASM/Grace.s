;commentaire bitch
%define STR "Ceci est un test"
%define DECLARE_MAIN global _main

section .data
hello:
	.str db STR, 0
	.file db CHILD, 0

section .text
	extern _dprintf

%macro start 1

extern _main

_main:
	push rbp
	mov rbp, rsp
	lea rdi, [rel hello.file]
	mov rsi, 0x0202
	mov rax, 0x2000005
	syscall
	
	mov rdi, rax
	lea rsi, [rel hello.str]
	lea rdx, [rel hello.str]
	mov rcx, 9
	mov r8, 10
	mov r9, 34
	call _dprintf
	leave
	ret

%endmacro
