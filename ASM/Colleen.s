; This program will print its own source

section .data
file_content:
	db "; This program will print its own source%2$c%2$csection .data%2$cfile_content:%2$c%4$cdb %3$c%1$s%3$c, 0%2$c%2$csection .text%2$c%4$cglobal _main%2$c%4$cextern _printf%2$c%2$cstart:%2$c%4$ccall _main%2$c%4$cret%2$c%2$c_main:%2$c%4$c; One comment%2$c%4$cpush rbp%2$c%4$cmov rbp, rsp%2$c%4$clea rdi, [rel file_content]%2$c%4$clea rsi, [rel file_content]%2$c%4$cmov rdx, 10%2$c%4$cmov rcx, 34%2$c%4$cmov r8, 9%2$c%4$ccall _printf%2$c%4$cmov rsp, rbp%2$c%4$cpop rbp%2$c%4$cret%2$c", 0

section .text
	global _main
	extern _printf

start:
	call _main
	ret

_main:
	; One comment
	push rbp
	mov rbp, rsp
	lea rdi, [rel file_content]
	lea rsi, [rel file_content]
	mov rdx, 10
	mov rcx, 34
	mov r8, 9
	call _printf
	mov rsp, rbp
	pop rbp
	ret
