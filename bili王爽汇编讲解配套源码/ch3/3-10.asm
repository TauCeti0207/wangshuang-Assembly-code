assume cs:code, ds:data, ss:stack ; 定义代码、数据、栈段

data segment
         dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H    ; 数据段
data ends

stack segment
          dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ; 栈段，用dw定义16个数据，每个数据占2个字节，共计32个字节
stack ends

code segment
    start:
    ;初始化各段寄存器
          mov  ax, stack    ; 将栈段地址赋给ax寄存器，即将ss指向栈段
          mov  ss, ax       ; 将ax中的值赋给ss寄存器，即将栈指针指向栈顶地址
          mov  sp,20h

          mov  ax, data     ; 将数据段地址赋给ax寄存器
          mov  ds, ax       ; 将ax中的值赋给ds寄存器，即将cs指向数据段
    
          mov  bx, 0        ; 将bx寄存器清零，cx寄存器赋值为8
          mov  cx, 8
    s:    
          push [bx]         ; 将bx所指向的数据入栈
          add  bx, 2        ; 将bx中的值加上2，即指向下一个数据
          loop s            ; 循环8次，将所有数据入栈
    
          mov  bx, 0        ; 将bx寄存器清零，cx寄存器赋值为8
          mov  cx, 8
    s0:   
          pop  [bx]         ; 将栈顶元素出栈，并存储到数据段的bx地址处
          add  bx, 2        ; 将bx中的值加上2，即指向下一个数据
          loop s0           ; 循环8次，将所有数据出栈
    
          mov  ax, 4c00h    ; 设置ax寄存器为4c00h（程序结束码）
          int  21h          ; 调用21h中断，结束程序

code ends                   ; 结束代码段
end start ; 程序入口