format ELF64
public _start

socket = 41
bind = 49
listen = 50
accept = 43
read = 0
open = 2
write = 1
close = 3

stdout = 1
af_inet = 2
sock_stream = 1
o_rdonly = 00
buf_size = 256

section '.text' executable
_start:
    ; socket
    mov rdi, af_inet
    mov rsi, sock_stream
    mov rdx, 0
    mov rax, socket
    syscall
    
    mov r12, rax ; socket fd r12

    ; bind
    mov rdi, r12
    mov rsi, address
    mov rdx, 16
    mov rax, bind
    syscall

_loop:
    ; listen
    mov rdi, r12
    mov rsi, 10  ; backlog queue size
    mov rax, listen
    syscall

    ; accept
    mov rdi, r12
    xor rsi, rsi ; optional arg
    xor rdx, rdx ; optional arg
    mov rax, accept
    syscall

    mov r13, rax ; client socket fd r13

    ; read from client fd
    mov rdi, r13
    mov rsi, buffer
    mov rdx, buf_size ; number of bytes to read
    mov rax, read
    syscall

    ; open
    mov rdi, path
    mov rsi, o_rdonly
    mov rax, open
    syscall

    ; read file
    mov rdi, rax ; fd from open
    mov rsi, buffer2
    mov rdx, buf_size
    mov rax, read
    syscall

    ; write to socket
    mov rdi, r13
    mov rsi, buffer2
    mov rdx, buf_size
    mov rax, write
    syscall

    ; print message
    mov rdi, stdout
    mov rsi, message
    mov rdx, message_len
    mov rax, write
    syscall

    ; close client fd
    mov rdi, r13
    mov rax, close
    syscall

    jmp _loop

section '.data' writeable
address:
    dw af_inet ; family
    dw 0x901f    ; port 8080
    dd 0       ; run on all local interfaces
    dq 0       ; padding

buffer:
    db buf_size dup 0 ; prepare 256 bit buffer

buffer2:
    db buf_size dup 0 ; prepare 256 bit buffer

path:
    db 'index.html', 0

message:
    db 'Sent response!', 0x0A, 0
    message_len = $ - message
