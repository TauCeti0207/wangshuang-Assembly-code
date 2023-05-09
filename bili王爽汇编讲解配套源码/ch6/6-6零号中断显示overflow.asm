;编写0号中断的处理程序

assume cs:code 

code segment

    start:   
    ;安装中断处理程序，其实就是代码字符在内存中复制的过程↓
             mov  ax, cs
             mov  ds, ax
             mov  si, offset do0                    ;设置ds:si指向源地址
             mov  ax, 0
             mov  es, ax
             mov  di, 200h                          ;设置es:di指向目的地址
             mov  cx, offset do0end - offset do0    ;设置cx为传输长度，即中断处理程序的长度
             cld                                    ;设置传输方向为正
             rep  movsb
		
    ;设置中断向量表，其实就是将中断处理程序的入口地址存放在0号中断源所对应的表项中 ↓
             mov  ax, 0
             mov  es, ax
             mov  word ptr es:[0*4], 200h           ;设置中断处理程序入口偏移地址
             mov  word ptr es:[0*4+2], 0            ;设置中断处理程序入口偏移地址

             mov  ax, 4c00h
             int  21h

    do0:     
             jmp  short do0start
             db   'overflow!'
		
    ;中断处理程序 ↓
    do0start:
             mov  ax, cs
             mov  ds, ax
             mov  si, 202h                          ;设置ds:si指向字符串
				
             mov  ax, 0b800h
             mov  es, ax
             mov  di, 12*160 +36*2                  ;设置es:di指向显存空间的中间位置
				
             mov  cx, 9
    s:       mov  al, [si]
             mov  es:[di], al
    ;  mov  byte ptr es:[di+1], 11000010b     ;为了增加显示效果，显示红底闪烁绿字
             inc  si
             add  di, 2
             loop s
				
             mov  ax, 4c00h
             int  21h
				
    do0end:  nop
    
code ends
end start 