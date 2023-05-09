assume cs:code, ds:data

data segment
         db 'unIX'
         db 'foRK'
data ends


code segment
    start:mov al,'a'
          mov bl,'b'
          mov ax, 4c00h    ; 设置ax寄存器为4c00h（程序结束码）
          int 21h          ; 调用21h中断，结束程序

code ends                  ; 结束代码段
end start