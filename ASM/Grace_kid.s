; commentaire
section .data
%macro x 1
%endmacro
%macro com 1
%endmacro
hello:
.string db "; commentaire%2$csection .data%2$c%4$cmacro x 1%2$c%4$cendmacro%2$c%4$cmacro com 1%2$c%4$cendmacro%2$chello:%2$c.string db %3$c%1$s%3$c, 0%2$csection .text%2$cglobal _main%2$cextern _printf%2$c%4$cmacro start 1%2$cpush rbp%2$cmov rbp, rsp%2$clea rdi, [rel hello.string]%2$clea rsi, [rel hello.string]%2$cmov rdx, 10%2$cmov rcx, 34%2$cmov r8, 37%2$ccall _printf%2$cleave%2$cret%2$c%4$cendmacro%2$c_main:%2$cstart hello.sring%2$cret%2$c", 0
section .text
global _main
extern _printf
%macro start 1
push rbp
mov rbp, rsp
lea rdi, [rel hello.string]
lea rsi, [rel hello.string]
mov rdx, 10
mov rcx, 34
mov r8, 37
call _printf
leave
ret
%endmacro
_main:
start hello.sring
ret
