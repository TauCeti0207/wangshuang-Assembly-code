assume cs:CODE
code segment
         MOV  ax,2
         mov  cx,11       ;循环了11次，算的是2^12
    s:   add  ax,ax
         LOOP S
         mov  ax,4c00h
         int  21H
code ends
end