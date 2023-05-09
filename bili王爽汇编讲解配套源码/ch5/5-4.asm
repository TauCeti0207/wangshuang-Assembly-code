assume cs:codesg,ds:data
data segment
         db 'conversationconversation',0
data ends

codesg segment
    start:  mov  ax,data
            mov  ds,ax
            mov  si,0
    ;循环处理
            call capital

            mov  ax,4c00h
            int  21h

    capital:mov  cl,[si]
            mov  ch,0
            jcxz ok
            and  byte ptr [si],11011111b
            inc  si
            jmp  short capital
    ok:     ret
codesg ends
end start