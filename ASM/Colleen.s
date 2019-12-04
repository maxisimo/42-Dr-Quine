; commentaire
section .data
hello:
.string db "; commentaire%2$csection .data%2$chello:%2$c.string db %3$c%1$s%3$c, 0%2$csection .text%2$cglobal start%2$cglobal _main%2$cextern _printf%2$cstart:%2$ccall _main%2$cret%2$c_main:%2$cpush rbp; commentaire%2$cmov rbp, rsp%2$clea rdi, [rel hello.string]%2$clea rsi, [rel hello.string]%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall _printf%2$cleave%2$cret%2$c", 0
section .text
global start
global _main
extern _printf
start:
call _main
ret
_main:
push rbp; commentaire
mov rbp, rsp
lea rdi, [rel hello.string]
lea rsi, [rel hello.string]
mov rdx, 10
mov rcx, 34
call _printf
leave
ret
