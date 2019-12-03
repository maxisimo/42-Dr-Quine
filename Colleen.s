; commentaire
section .data
hello:
.str db "; commentaire%2$csection .data%2$chello:%2$c.str db %3$c%1$s%3$c, 0%2$csection .text%2$cglobal _main%2$cextern _printf%2$c_main:%2$cpush rbp; stack save%2$cmov rbp, rsp%2$clea rdi, [rel hello.str]%2$clea rsi, [rel hello.str]%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall _printf%2$cleave%2$ccall end%2$cend:%2$cret", 0
section .text
global _main
extern _printf
_main:
push rbp; stack save
mov rbp, rsp
lea rdi, [rel hello.str]
lea rsi, [rel hello.str]
mov rdx, 10
mov rcx, 34
call _printf
leave
call end
end:
ret
