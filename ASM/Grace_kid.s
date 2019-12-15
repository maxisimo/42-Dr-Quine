; Un commentaire

%define STRING "; Un commentaire%2$c%%define STRING %3$c%1$s%3$c%2$c%%define CHILD %3%cGrace_kid.s%3$c%2$c%2$csection .data%2$chello:%2$c%4$c.string db STRING, 0%2$c%4$c.file db CHILD, 0%2$c%2$c%%macro start 1%2$c%2$cextern _main, _dprintf%2$c%2$c_main:%2$c%4$cpush rpb%2$c%4$cmovrbp, rsp%2$c%4$clea rdi, [rel hello.file]%2$c%4$cmov rsi, 0x0202%2$c%4$cmov rax, 0x2000005%2$c%4$csyscall%2$c%4$cmov rdi, rax%2$c%4$clea rsi, [rel hello.string]%2$c%4$clea rdx, [rel hello.string]%2$c%4$cmov rcx, 10%2$c%4$cmov r8, 34%2$c%4$cmov r9, 9%2$c%4$ccall _dprintf%2$c%4$cleave%2$c%4$cret%2$c%4$c%2$c%%endmacro%2$c%2$cstart STRING%2$c"
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
