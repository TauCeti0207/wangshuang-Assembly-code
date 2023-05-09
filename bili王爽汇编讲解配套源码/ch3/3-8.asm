

; 定义代码段
assume cs:code
code segment
          dw   0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H    ;
    start:
          mov  bx, 0                                              ; 初始化bx寄存器为0，用于数组索引
          mov  ax, 0                                              ; 初始化ax寄存器为0，用于累加数组元素值
          mov  cx, 8                                              ; 初始化cx寄存器为8，表示数组m中有8个元素
    s:    
          add  ax, cs:[bx]                                        ; 将数组m中bx索引对应的元素值累加到ax寄存器中
          add  bx, 2                                              ; 索引自增2，指向下一个元素
          loop s                                                  ; 循环8次，直到访问完数组m中的所有元素
          
          mov  ax, 4c00h                                          ; 设置ax寄存器为4c00h（程序结束码）
          int  21h                                                ; 调用21h中断，结束程序
code ends
end start
