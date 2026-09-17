desktop_main:

desktop_redraw:

    call clear_screen

    mov si,title_msg
    call print_string
    call newline
    call newline

    mov si,opt1
    call print_string
    call newline

    mov si,opt2
    call print_string
    call newline

    mov si,opt3
    call print_string
    call newline

desktop_wait:

    call read_key

    cmp al,'1'
    je desktop_shell

    cmp al,'2'
    je desktop_editor

    cmp al,'3'
    je desktop_files

    jmp desktop_wait

desktop_shell:
    call shell_main
    jmp desktop_redraw

desktop_editor:
    call editor_main
    jmp desktop_redraw

desktop_files:
    call files_main
    jmp desktop_redraw

title_msg db "=== EDRYS OS ===",0
opt1 db "1 - Shell",0
opt2 db "2 - Editor",0
opt3 db "3 - Files",0
