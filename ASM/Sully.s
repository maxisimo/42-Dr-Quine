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
	db "section .data%1$ccheck_file:%1$c	db %2$cSully_5.s%2$c, 0%1$cfile_name:%1$c	db %2$c%8$s%2$c, 0%1$coutput_name:%1$c	db %2$c%7$s%2$c, 0%1$ccommand:%1$c	db %2$c%5$s%2$c, 0%1$cfile_content:%1$c	db %2$c%3$s%2$c, 0%1$c%1$csection .bss%1$cfinal_cmd:	resb 255%1$cpath:		resb 15%1$coutput:		resb 15%1$cobject:		resb 15%1$cfile_num:	resb 4%1$c%1$csection .text%1$c	global _main%1$c	extern _sprintf%1$c	extern _dprintf%1$c	extern _system%1$c	extern _access%1$c%1$c_main:%1$c	push rbx%1$c	mov rdi, %4$d%1$c	mov [rel file_num], rdi%1$c	lea rdi, [rel check_file]%1$c	mov rsi, 0x04%1$c	call _access%1$c	cmp rax, -1%1$c	je create_path%1$c	mov rdi, [rel file_num]%1$c	dec rdi%1$c	mov [rel file_num], rdi%1$c%1$ccreate_path:%1$c	lea rdi, [rel path]%1$c	lea rsi, [rel file_name]%1$c	mov rdx, [rel file_num]%1$c	mov rcx, 's'%1$c	call _sprintf%1$c%1$ccreate_object:%1$c	lea rdi, [rel object]%1$c	lea rsi, [rel file_name]%1$c	mov rdx, [rel file_num]%1$c	mov rcx, 'o'%1$c	call _sprintf%1$c%1$ccreate_output:%1$c	lea rdi, [rel output]%1$c	lea rsi, [rel output_name]%1$c	mov rdx, [rel file_num]%1$c	call _sprintf%1$c%1$ccreate_command:%1$c	lea rdi, [rel final_cmd]%1$c	lea rsi, [rel command]%1$c	lea rdx, [rel output]%1$c	lea rcx, [rel path]%1$c	lea r8, [rel object]%1$c	call _sprintf%1$c%1$ccreate_file:%1$c	lea rdi, [rel path]%1$c	mov rax, 0x2000005%1$c	mov rdx, 0o644%1$c	mov rsi, 0x0202%1$c	syscall%1$c%1$c	mov rdi, rax%1$c	lea rsi, [rel file_content]%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	lea r8, [rel file_content]%1$c	mov r9, [rel file_num]%1$c	lea rbx, [rel file_name]%1$c	push rbx%1$c	lea rbx, [rel output_name]%1$c	push rbx%1$c	lea rbx, [rel command]%1$c	push rbx%1$c	push rbx%1$c	call _dprintf%1$c	pop rbx%1$c	pop rbx%1$c	pop rbx%1$c	pop rbx%1$c	mov r12, [rel file_num]%1$c	cmp r12, 0%1$c	jle exit%1$c	lea rdi, [rel final_cmd]%1$c	call _system%1$c%1$cexit:%1$c	pop rbx%1$c	ret%1$c", 0

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
	mov rax, 0x2000005
	mov rdx, 0o644
	mov rsi, 0x0202
	syscall

	mov rdi, rax
	lea rsi, [rel file_content]
	mov rdx, 10
	mov rcx, 34
	lea r8, [rel file_content]
	mov r9, [rel file_num]
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
