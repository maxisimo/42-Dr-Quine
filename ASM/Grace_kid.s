; commentaire
section .data
%macro x 1
%endmacro
%macro com 1
%endmacro
hello:
.string db "; commentaire%2$csection .data%2$c%macro x 1%2$c%endmacro%2$c%macro com 1%2$c%endmacrohello:%2$c.string db %3$c%1$s%3$c, 0%2$csection .text%2$cglobal start%2$cglobal _main%2$cextern _printf%2$c%macro start 1%2$cpush rbp%2$cmov rbp, rsp%2$clea rdi, [rel hello.string]%2$clea rsi, [rel hello.string]%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall _printf%2$cleave%2$cret%2$c%endmacro%2$c_main:%2$cstart hello.sring%2$cret%2$c", 0
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
call _printf
leave
ret
%endmacro
_main:
start hello.sring
ret

; Tu vas surement devoir mettre en ascii le % car il y a un probleme d'affichage avec les macros
