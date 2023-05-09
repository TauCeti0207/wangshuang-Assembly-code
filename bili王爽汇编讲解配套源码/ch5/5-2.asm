assume cs:codesg,ds:data
data segment
         dw 1,2,3,4,5,6,7,8
         dd 8 dup (0)
data ends

codesg segment
    start: mov  ax,data
           mov  ds,ax
           mov  si,0
           mov  di,16
    ;循环处理
           mov  cx,8
    s:     mov  bx,[si]
           call cube
           mov  [di],ax
           mov  [di].2,dx    ;高16位放到di+2的位置
           add  si,2
           add  di,4
           loop s
    ;注意：就是 cube 过程的最后一行 ret 后面还有一些指令，导致这些指令永远不会被执行到。这些指令应该放在 ret 前面。
           mov  ax,4c00h
           int  21h
    cube:  mov  ax,bx
           mul  bx
           mul  bx
           ret
codesg ends
end start