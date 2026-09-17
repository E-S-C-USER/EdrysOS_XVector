clear_screen:
    mov ax,3
    int 10h
    ret

print_char:
    mov ah,0Eh
    int 10h
    ret

print_string:
ui_print_loop:
    lodsb
    cmp al,0
    je ui_print_done

    call print_char
    jmp ui_print_loop

ui_print_done:
    ret

newline:
    mov ah,0Eh

    mov al,13
    int 10h

    mov al,10
    int 10h

    ret

read_key:
    mov ah,0
    int 16h
    ret

erase_char:

    mov ah,0Eh

    mov al,8
    int 10h

    mov al,' '
    int 10h

    mov al,8
    int 10h

    ret
    