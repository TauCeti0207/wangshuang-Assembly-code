assume cs:codesg,ds:datasg
datasg segment
           dd 186A1h    ;对应16进制是000q186A1
           dw 64h
           dw 0h
datasg ends

codesg segment
    start: 
           mov ax,datasg
           mov ds,ax
           mov ax,ds:[0]
           mov dx,ds:[2]
           div word ptr ds:[4]
           mov ds:[6],ax

           mov ax,4c00h
           int 21h
codesg ends
end start