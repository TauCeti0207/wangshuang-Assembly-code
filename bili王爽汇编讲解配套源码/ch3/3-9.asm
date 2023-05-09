; 定义代码段
assume cs:codesg
codesg segment
    ; 数据段，用dw定义16位数据，每个数据占2个字节，共计16*2=32个字节
           dw   0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H    ;
           dw   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0                    ;
           
    start: 
    ; 将代码段地址赋给ax寄存器，即将cs指向代码段
           mov  ax,cs
    ; 将ax中的值赋给ss寄存器，即将栈指针指向代码段
           mov  ss,ax
    ; 设置栈顶指针的初始值为30h
           mov  sp,30h
           
    ; 入栈操作
    ; 将bx寄存器清零，cx寄存器赋值为8
           mov  bx,0
           mov  cx,8
    s:                                                             ; 将cx所指向的数据入栈
           push cs:[bx]
    ; 将bx中的值加上2，即指向下一个数据
           add  bx,2
    ; 循环8次，将所有数据入栈
           loop s
           
    ; 出栈操作
    ; 将bx寄存器清零，cx寄存器赋值为8
           mov  bx,0
           mov  cx,8
    s0:                                                            ; 将栈顶元素出栈，并存储到代码段的bx地址处
           pop  cs:[bx]
    ; 将bx中的值加上2，即指向下一个数据
           add  bx,2
    ; 循环8次，将所有数据出栈
           loop s0
          
    ; 设置ax寄存器为4c00h（程序结束码）
           mov  ax, 4c00h
    ; 调用21h中断，结束程序
           int  21h
codesg ends
end start
