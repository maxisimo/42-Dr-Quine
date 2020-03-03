section .data
check_file:
	db "Sully_5.s", 0
file_name:
	db "Sully_%d.%c", 0
hello:
	.string db "J'ai %5$d doigts", 0

section .bss
path:		resb 15
file_num:	resb 4

section .text
	global _main
	extern _printf
	extern _sprintf
	extern _dprintf
	extern _access

_main:
	push rbp
	mov rbp, rsp
	mov rdi, 5
	mov [rel file_num], rdi
	lea rdi, [rel check_file]
	mov rsi, 0x04
	call _access
	cmp rax, -1
	je create_path
	mov rdi, [rel file_num]
	dec rdi
	mov [rel file_num], rdi

create_path:
	lea rdi, [rel path]
	lea rsi, [rel file_name]
	mov rdx, [rel file_num]
	mov rcx, 's'
	call _sprintf

print_string:
	lea rdi, [rel path]
	mov rax, 0x2000005
	mov rdx, 0o644
	mov rsi, 0x0202
	syscall

	mov rdi, rax
	lea rsi, [rel hello.string]
	lea rdx, [rel hello.string]
	mov rcx, 10
	mov r8, 34
	mov r9, 9
	mov r10, [rel file_num]
	call _dprintf

	lea rdi, [rel hello.string]
	lea rsi, [rel hello.string]
	mov rdx, 10
	mov rcx, 34
	mov r8, 9
	mov r9, [rel file_num]
	call _printf
	leave
	ret


; https://www.unilim.fr/pages_perso/tristan.vaccon/cours_nasm.pdf
; http://www.lacl.fr/tan/asm
; https://www.cs.uaf.edu/2015/fall/cs301/lecture/09_16_stack.html
