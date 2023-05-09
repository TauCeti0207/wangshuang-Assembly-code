assume cs:codesg,ds:datasg
datasg segment
           db 3 dup (0)
           db 3 dup (0,1,2)
           db 80 dup (0)
           db 3 dup ('abc','ABC')
datasg ends

codesg segment
    start: 
           mov ax,datasg
           mov ds,ax

           mov ax,4c00h
           int 21h
codesg ends
end start