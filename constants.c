#include <sys/syscall.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <fcntl.h>

// rdi   rsi   rdx   r10   r8    r9

// syscalls
socket = SYS_socket
bind = SYS_bind
listen = SYS_listen
accept = SYS_accept
read = SYS_read
open = SYS_open
write = SYS_write
close = SYS_close

// other stuff
af_inet = AF_INET
sock_stream = SOCK_STREAM
o_rdonly = O_RDONLY
