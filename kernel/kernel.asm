bits 16
org 0x8000

start:
    mov ax, cs
    mov ds, ax

    call desktop_main

halt:
    jmp halt

%include "kernel/ui.asm"
%include "kernel/files.asm"
%include "kernel/shell.asm"
%include "kernel/editor.asm"
%include "kernel/desktop.asm"
%include "kernel/memory.asm"
