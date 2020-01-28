section .data
hello:
.security db "Sully_5.s", 0
.file db "Sully_%d.s", 0
.bin db "Sully_%d", 0
.comp db "nasm -f macho64 %s", 0
.link db "gcc %s.o -o %s", 0
.exec db "./%s", 0
.str db "Ceci est encore un test", 0
section .text
global _main
extern _dprintf
extern _sprintf
extern _system
extern _exit
_main:
push rbp
mov rbp, rsp
mov r12, 5
call check
sub rsp , 16
lea rdi, [rel rsp]
lea rsi, [rel hello.file]
mov rdx, r12
call _sprintf
mov rdi, rsp
mov rsi, 0x0202
mov rax, 0x2000005
mov rdx, 0x01FF
syscall
lea rsi, [rel hello.str]
mov rdi, rax
lea rdx, [rel hello.str]
mov rcx, 10
mov r8, 34
mov r9, r12
call _dprintf
mov rax, 0x2000006
syscall
cmp r12, 0x0
ja execution
leave
ret
check:
cmp r12, 0x0
jl end
lea rdi, [rel hello.security]
mov rsi, 0
mov rax, 0x2000021
syscall
jae titi
ret
titi:
dec r12
ret
end:
leave
ret
execution:
lea rdx, [rel rsp]
sub rsp, 32
lea rdi, [rel rsp]
lea rsi, [rel hello.comp]
call _sprintf
lea rdi, [rel rsp]
call _system
sub rsp, 32
lea rdi, [rel rsp]
lea rsi, [rel hello.bin]
mov rdx, r12
call _sprintf
lea rdx , [rel rsp]
sub rsp, 32
lea rdi, [rel rsp]
lea rsi, [rel hello.link]
lea rcx , [rel rsp + 32]
call _sprintf
lea rdi, [rel rsp]
call _system
lea rdx, [rel rsp + 32]
sub rsp, 32
lea rdi, [rel rsp]
lea rsi, [rel hello.exec]
call _sprintf
lea rdi, [rel rsp]
call _system
leave
ret