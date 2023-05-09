;使用附加段寄存器
assume cs:code
code segment
         mov  ax,0fffh
         mov  ds,ax
         mov  ax,0020h
         mov  es,ax         ;附加段寄存器

         mov  bx,0
         mov  cx,12         ;循环次数
         
    S:   mov  dl,ds:[bx]    ;不加默认也是ds的
         mov  es:[bx],dl
         inc  bx
         loop s
         mov  ax,4c00h
         int  21h
code ends
end 
