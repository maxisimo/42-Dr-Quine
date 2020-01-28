; Un commentaire

%define STRING "; Un commentaire%3$c%3$c%%define STRING %4$c%1$s%4$c%3$c%%define CHILD %4$cGrace_kid.s%4$c%3$c%3$csection .data%3$chello:%3$c%2$c.str db STRING, 0%3$c%2$c.filename db CHILD, 0%3$c%3$csection .text%3$c%2$cextern _dprintf%3$c%3$c%%macro start 1%3$c%3$cextern _main%3$c%3$c_main:%3$c%2$cpush rbp%3$c%2$cmov rbp, rsp%3$c%2$cmov rax, 0x2000005%3$c%2$clea rdi, [rel hello.filename]%3$c%2$cmov rsi, 0x0202%3$c%2$csyscall%3$c%3$c%2$cmov rdi, rax%3$c%2$clea rsi, [rel hello.str]%3$c%2$clea rdx, [rel hello.str]%3$c%2$cmov rcx, 9%3$c%2$cmov r8, 10%3$c%2$cmov r9, 34%3$c%2$ccall _dprintf%3$c%2$cleave%3$c%2$cret%3$c%3$c%%endmacro%3$c%3$cstart STRING%3$c"
%define CHILD "Grace_kid.s"

section .data
hello:
	.str db STRING, 0
	.filename db CHILD, 0

section .text
	extern _dprintf

%macro start 1

extern _main

_main:
	push rbp
	mov rbp, rsp
	mov rax, 0x2000005
	lea rdi, [rel hello.filename]
	mov rsi, 0x0202
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

start STRING
