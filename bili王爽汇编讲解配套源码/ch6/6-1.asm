assume cs:codesg,ds:data
data segment
         db 'welcome to masm!'
data ends

codesg segment
    start: 
           mov  ax,data
           mov  ds,ax
           mov  ax,0b800h
           mov  es,ax
           mov  si,0
           mov  di,160*12+80-16

           mov  cx,16
    w:     
           mov  al,ds:[si]
           mov  es:[di],al
           inc  di
           mov  al,71H
           mov  es:[di],al
           inc  si
           inc  di
           loop w
           mov  ax,4c00h
           int  21h

codesg ends
end start