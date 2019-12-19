section .data
start:
	i equ 5
	.string db "", 0
	section .text
	global _main
	extern _printf

_main:
	push rbp
	mov rbp, rsp
	lea rdi, [rel start.string]
	lea rsi, [rel start.string]
	mov rdx, 10
	mov rcx, 34
	call _printf
	leave
	ret
