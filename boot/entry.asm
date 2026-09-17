bits 16
org 0x7C00

start:
    mov [boot_drive], dl

    xor ax, ax
    mov es, ax

    mov ah, 2
    mov al, 16

    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, [boot_drive]

    mov bx, 0x8000

    int 0x13

    jmp 0x0000:0x8000

boot_drive db 0

times 510-($-$$) db 0
dw 0xAA55
