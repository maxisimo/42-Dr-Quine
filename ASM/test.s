section .data
file_name:
	db "Sully_test.s", 0
file_exec:
	db "Sully_test", 0
command:
	db "nasm -f macho64 Sully_test.s -o Sully_test.o && gcc Sully_test.o -o Sully_test && ./Sully_test", 0
file_content:
	db "section .data%3$chello:%3$c%2$c.string db %4$c%1$s%4$c%3$c%3$csection .text%3$c%2$cglobal start%3$c%2$cglobal _main%3$c%2$cextern _printf%3$c%3$cstart:%3$c%2$ccall _main%3$c%2$cret%3$c%3$c_main:%3$c%2$c%3$c%2$cpush rbp%3$c%2$cmov rbp, rsp%3$c%2$clea rdi, [rel hello.string]%3$c%2$clea rsi, [rel hello.string]%3$c%2$cmov rdx, 9%3$c%2$cmov rcx, 10%3$c%2$cmov r8, 34%3$c%2$ccall _printf%3$c%2$cleave%3$c%2$cret%3$c", 0

section .text
	global _main
	extern _dprintf
	extern _system

_main:
	push rbp,
	mov rbp, rsp
	mov rax, 0x2000005
	lea rdi, [rel file_name]
	mov rsi, 0x202
	mov rdx, 0o644
	syscall

	mov rdi, rax
	lea rsi, [rel file_content]
	lea rdx, [rel file_content]
	mov rcx, 9
	mov r8, 10
	mov r9, 34
	lea rbx, [rel file_name]
	push rbx
	lea rbx, [rel file_exec]
	push rbx
	push rbx
	lea rbx, [rel command]
	push rbx
	call _dprintf
	pop rbx
	pop rbx
	pop rbx
	pop rbx
	lea rdi, [rel command]
	call _system
	pop rbx
	ret
# https://www.unilim.fr/pages_perso/tristan.vaccon/cours_nasm.pdf
