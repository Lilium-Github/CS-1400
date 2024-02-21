; Hello world assembly program
;                          
; Author: Abraham Maldonado   
; GitHub: https://github.com/lilium-github
; Date: 2/20/2024         
;
; Compiling the program    
; For compiling this hello world program you can use nasm and ld 
;
;   $ nasm -felf64 hello.asm
;   $ ld hello.o -o exe.a
;   $ ./exe.a

section        .text                         ; declare the .text section    
global         _start          
_start:                                      ; entry point for _start
    mov edx, len                             ; "invoke" the len of the message
    mov ecx, msg                             ; "invoke" the message itself
    mov ebx, 1                               ; set the file descriptor (fd) to stdout
    mov eax, 4                               ; system call for "write"
    int 0x80                                 ; call the kernel, interrupt
    mov eax, 1                               ; system call for exit
    int 0x80                                  

section        .data                         ; section to declare data
    msg        db "Hello dlrow!", 0xa  
    len        equ $ -msg
