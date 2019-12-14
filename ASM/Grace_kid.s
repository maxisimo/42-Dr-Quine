; Un commentaire

%define STRING ""
%define CHILD "Grace_kid.s"

section .data
hello:
	.string db STRING, 0
	.file db CHILD, 0

%macro start 1

extern _main, _dprintf

_main:
	push rbp
	mov rbp, rsp
	lea rdi, [rel hello.file]
	mov rsi, 0x0202
	mov rax, 0x2000005
	syscall
	mov rdi, rax
	lea rsi, [rel hello.string]
	lea rdx, [rel hello.string]
	mov rcx, 10
	mov r8, 34
	mov r9, 9
	call _dprintf
	leave
	ret

%endmacro

start STRING
