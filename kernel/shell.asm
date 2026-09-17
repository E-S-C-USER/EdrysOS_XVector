shell_main:

    call clear_screen

shell_loop:

    mov si,shell_prompt
    call print_string

    mov di,shell_buffer

shell_read:

    call read_key

    cmp al,13
    je shell_execute

    cmp al,8
    je shell_backspace

    stosb
    call print_char

    jmp shell_read

shell_backspace:

    cmp di,shell_buffer
    je shell_read

    dec di
    mov byte [di],0

    call erase_char

    jmp shell_read

shell_execute:

    mov al,0
    stosb

    call newline

    mov si,shell_buffer
    mov di,cmd_exit
    call strcmp

    cmp ax,1
    je shell_exit

    mov si,shell_buffer
    mov di,cmd_help
    call strcmp

    cmp ax,1
    je shell_help

    mov si,msg_unknown
    call print_string
    call newline

    jmp shell_loop

shell_help:
    mov si,msg_help
    call print_string
    call newline
    jmp shell_loop

shell_exit:
    ret

strcmp:
strcmp_loop:
    mov al,[si]
    mov bl,[di]

    cmp al,bl
    jne strcmp_false

    cmp al,0
    je strcmp_true

    inc si
    inc di

    jmp strcmp_loop

strcmp_true:
    mov ax,1
    ret

strcmp_false:
    mov ax,0
    ret

shell_prompt db "Shell> ",0

cmd_help db "help",0
cmd_exit db "exit",0

msg_help db "help exit",0
msg_unknown db "Unknown command",0

shell_buffer times 64 db 0
