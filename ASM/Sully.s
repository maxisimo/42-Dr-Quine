section .data
check_file:
	db "Sully_5.s", 0
file_name:
	db "Sully_%d.%c", 0
output_name:
	db "Sully_%d", 0
command:
	db "nasm -f macho64 %2$s && gcc -o %1$s %3$s && ./%1$s", 0
file_content:
	db "section .data%1$ccheck_file:%1$c%3$cdb %2$cSully_5.s%2$c, 0%1$cfile_name:%1$c%3$cdb %2$cSully_%%d.%%c%2$c, 0%1$coutput_name:%1$c%3$cdb %2$cSully_%%d%2$c, 0%1$ccommand:%1$c%3$cdb %2$cnasm -f macho64 %%2$s && gcc -o %%1$s %%3$s && ./%%1$s%2$c, 0%1$cfile_content:%1$c%3$cdb %2$c%4$s%2$c, 0%1$c%1$csection .bss", 0

section .bss
final_cmd:	resb 255
path:		resb 15
output:		resb 15
object:		resb 15
file_num:	resb 4

section .text
	global _main
	extern _sprintf
	extern _dprintf
	extern _system
	extern _access

_main:
	push rbx
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
	lea rsi, [rel output_name]
	mov rdx, [rel file_num]
	call _sprintf

create_command:
	lea rdi, [rel final_cmd]
	lea rsi, [rel command]
	lea rdx, [rel output]
	lea rcx, [rel path]
	lea r8, [rel object]
	call _sprintf

create_file:
	lea rdi, [rel path]
	mov rsi, 0x202
	mov rax, 0x2000005
	mov rdx, 644o
	syscall

	mov rdi, rax
	lea rsi, [rel file_content]
	mov rdx, 10
	mov rcx, 34
    mov r8, 9
	lea r9, [rel file_content]
	mov r10, [rel file_num]
	lea rbx, [rel file_name]
	push rbx
	lea rbx, [rel output_name]
	push rbx
	lea rbx, [rel command]
	push rbx
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
