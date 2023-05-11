assume cs:code
code segment
    start:
          mov al,8                              ;8号单元存储着月份信息
          out 70h,al
          in  al,71h
          mov ah,al
          mov cl,4
          shr ah,cl
          and al,00001111b
          add ah,30h                            ;转换为ASCII
          add al,30h
          mov bx,0b800h
          mov es,bx
          mov byte ptr es:[160*12+40*2],ah
          mov byte ptr es:[160*12+40*2+2],al
          mov ax,4c00h
          int 21h
code ends
end start