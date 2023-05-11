;BIOS中断调用示例，在屏幕的5行12列显示3个红底高亮闪烁绿色的‘a’
assume cs:codesg

codesg segment
    start: 
    ;设置光标位置为屏幕第5行，第12列 (Set cursor position to row 5, column 12)
           mov ah,2
           mov bh,0
           mov dh,5
           mov dl,12
           int 10h
           
    ; 在屏幕上显示3个闪烁的、绿色的 'a' 字符，背景颜色为红色 (Display 3 blinking green 'a' characters on red background)
           mov ah,9
           mov al,'a'
           mov bl,11001010b
           mov bh,0
           mov cx,3
           int 10h

           mov ax,4c00h
           int 21h
codesg ends
end start