files_main:

 ***call clear_screen

    mov si,fi***_title
    call print_string
   ***ll newline

    mov si,files_hel***   call print_string
    call ne***ne
    call newline

wait_files:***   call read_key

    cmp al,27
    jne wait_files

    ret

files_title db "*** FILES ***",0
files_help db "ESC pour quitter",0
