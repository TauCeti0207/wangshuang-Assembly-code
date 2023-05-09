assume cs:code
code segment
         mov  ax,0ffffh
         mov  ds,ax

         mov  bx,0
         mov  dx,0
         mov  cx,12         ;循环12次
    s:   mov  al,ds:[bx]    ;加上段前缀 也可以不写
         mov  ah,0
         add  dx,ax
         inc  bx
         loop s

         mov  ax,4c00h
         int  21h
code ends
end