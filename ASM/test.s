section .data
file_name:
	db "Sully_%d.%c", 0
file_exec:
	db "Sully_%d", 0
command:
	db "nasm -f macho64 %1$s -o %2$s && gcc %2$s -o %3$s && ./%3$s", 0
file_content:
	db "section .data%3$chello:%3$c%2$c.string db %4$c%1$s%4$c%3$c%3$csection .text%3$c%2$cglobal start%3$c%2$cglobal _main%3$c%2$cextern _printf%3$c%3$cstart:%3$c%2$ccall _main%3$c%2$cret%3$c%3$c_main:%3$c%2$c%3$c%2$cpush rbp%3$c%2$cmov rbp, rsp%3$c%2$clea rdi, [rel hello.string]%3$c%2$clea rsi, [rel hello.string]%3$c%2$cmov rdx, 9%3$c%2$cmov rcx, 10%3$c%2$cmov r8, 34%3$c%2$ccall _printf%3$c%2$cleave%3$c%2$cret%3$c", 0

section .bss
final_cmd:	resb 255
path:		resb 15
object:		resb 15
output:		resb 15
file_num:	resb 2

section .text
	global _main
	extern _dprintf
	extern _sprintf
	extern _system

_main:
	push rbp,
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

create_object:
	lea rdi, [rel object]
	lea rsi, [rel file_name]
	mov rdx, [rel file_num]
	mov rcx, 'o'
	call _sprintf

create_output:
	lea rdi, [rel output]
	lea rsi, [rel file_name]
	mov rdx, [rel file_num]
	call _sprintf

create_command:
	lea rdi, [rel final_cmd]
	lea rsi, [command]
	mov rdx, [rel path]
	mov rcx, [rel object]
	mov r8, [rel output]
	call _sprintf

create_file:
	mov rax, 0x2000005
	lea rdi, [rel path]
	mov rsi, 0x202
	mov rdx, 0o644
	syscall

	mov rdi, rax
	lea rsi, [rel file_content]
	lea rdx, [rel file_content]
	mov rcx, 9
	mov r8, 10
	mov r9, 34
	mov r10, [rel file_num]
	lea rbx, [rel file_name]
	push rbx
	lea rbx, [rel file_exec]
	push rbx
	push rbx
	lea rbx, [rel final_cmd]
	push rbx
	call _dprintf
	pop rbx
	pop rbx
	pop rbx
	pop rbx
	mov r12, [rel file_num]
	cmp r12, 0
	jle exit
	lea rdi, [rel final_cmd]
	call _system

exit:
	pop rbx
	ret

; https://www.unilim.fr/pages_perso/tristan.vaccon/cours_nasm.pdf
; http://www.lacl.fr/tan/asm
; https://www.cs.uaf.edu/2015/fall/cs301/lecture/09_16_stack.html
