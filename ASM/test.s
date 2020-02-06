section .data
check_file:
	db "Sully_5.s"
file_name:
	db "Sully_%d.%c", 0
file_exec:
	db "Sully_%d", 0
command:
	db "nasm -f macho64 %1$s -o %2$s && gcc %2$s -o %3$s && ./%3$s", 0
file_content:
	db "section .data%1$ccheck_file:%1$c%3$cdb %2$cSully_5.s%2$c, 0%1$cfile_name:%1$c%3$cdb %2$cSully_%%d.%%c%2$c, 0%1$cfile_exec:%1$c%3$cdb %2$cSully_%%d%2$c, 0%1$ccommand:%1$c%3$cdb %2$cnasm -f macho64 %%1$s -o %%2$s && gcc %%2$s -o %%3$s && ./%%3$s%2$c, 0%1$cfile_content:%1$c%3$cdb %2$c%4$s%2$c, 0%1$c%1$csection .bss%1$cfinal_cmd:%3$cresb 255%1$cpath:%3$c%3$cresb 15%1$cobject:%3$c%3$cresb 15%1$coutput:%3$c%3$cresb 15%1$cfile_num:%3$cresb 2%1$c%1$csection .text%1$c%3$cglobal _main%1$c%3$cextern _dprintf%1$c%3$cextern _sprintf%1$c%3$cextern _system%1$c%1$c_main:%1$c%3$cpush rbp,%1$c%3$cmov rbp, rsp%1$c%3$cmov rdi, %5$d%1$c%3$cmov [rel file_num], rdi%1$c%3$clea rdi, [rel check_file]%1$c%3$cmov rsi, 0x04%1$c%3$ccall _access%1$c%3$ccmp rax, -1%1$c%3$cje create_path%1$c%3$cmov rdi, [rel file_num]%1$c%3$cdec rdi%1$c%3$cmov [rel file_num], rdi%1$c%1$ccreate_path:%1$c%3$clea rdi, [rel path]%1$c%3$clea rsi, [rel file_name]%1$c%3$cmov rdx, [rel file_num]%1$c%3$cmov rcx, 's'%1$c%3$ccall _sprintf%1$c%1$ccreate_object:%1$c%3$clea rdi, [rel object]%1$c%3$clea rsi, [rel file_name]%1$c%3$cmov rdx, [rel file_num]%1$c%3$cmov rcx, 'o'%1$c%3$ccall _sprintf%1$c%1$ccreate_output:%1$c%3$clea rdi, [rel output]%1$c%3$clea rsi, [rel file_name]%1$c%3$cmov rdx, [rel file_num]%1$c%3$ccall _sprintf%1$c%1$ccreate_command:%1$c%3$clea rdi, [rel final_cmd]%1$c%3$clea rsi, [command]%1$c%3$cmov rdx, [rel path]%1$c%3$cmov rcx, [rel object]%1$c%3$cmov r8, [rel output]%1$c%3$ccall _sprintf%1$c%1$ccreate_file:%1$c%3$cmov rax, 0x2000005%1$c%3$clea rdi, [rel path]%1$c%3$cmov rsi, 0x202%1$c%3$cmov rdx, 0o644%1$c%3$csyscall%1$c%1$c%3$cmov rdi, rax%1$c%3$clea rsi, [rel file_content]%1$c%3$clea rdx, [rel file_content]%1$c%3$cmov rcx, 9%1$c%3$cmov r8, 10%1$c%3$cmov r9, 34%1$c%3$cmov r10, [rel file_num]%1$c%3$clea rbx, [rel file_name]%1$c%3$cpush rbx%1$c%3$clea rbx, [rel file_exec]%1$c%3$cpush rbx%1$c%3$cpush rbx%1$c%3$clea rbx, [rel final_cmd]%1$c%3$cpush rbx%1$c%3$ccall _dprintf%1$c%3$cpop rbx%1$c%3$cpop rbx%1$c%3$cpop rbx%1$c%3$cpop rbx%1$c%3$cmov r12, [rel file_num]%1$c%3$ccmp r12, 0%1$c%3$cjle exit%1$c%3$clea rdi, [rel final_cmd]%1$c%3$ccall _system%1$c%1$cexit:%1$c%3$cpop rbx%1$c%3$cret%1$c%1$c", 0

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
