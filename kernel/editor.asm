editor_main:

    call clear_screen

    mov si,editor_title
    call print_string
    call newline

    mov si,editor_help
    call print_string
    call newline
    call newline

    mov di,editor_buffer

editor_loop:

    call read_key

    cmp al,27
    je editor_exit

    cmp al,13
    je editor_newline

    cmp al,8
    je editor_backspace

    stosb
    call print_char

    jmp editor_loop

editor_newline:

    call newline
    jmp editor_loop

editor_backspace:

    cmp di,editor_buffer
    je editor_loop

    dec di
    mov byte [di],0

    call erase_char

    jmp editor_loop

editor_exit:
    ret

editor_title db "*** EDITOR ***",0
editor_help d***ESC pour quitter",0

editor_buff***times 1024 db 0
