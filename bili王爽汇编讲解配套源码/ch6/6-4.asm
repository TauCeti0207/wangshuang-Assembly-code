assume cs:codesg,ss:stacksg,ds:datasg
stacksg segment
            db 200h dup (0)
stacksg ends

datasg segment
    ;这是一个以 null 结尾的字符串常量，它由多个 ASCII 字符组成。
    ; db 13 表示字符回车(CR, Carriage Return)，将光标移动到当前行的开头。
    ; db 10 表示换行(LF, Line Feed)，将光标移动到下一行的开头。
    ; 'hello world!' 是希望输出的字符串内容。
    ; db 13 和 db 10 分别表示第一个回车和换行，目的是将光标移动到下一行的开头。
    ; '$' 是 null 字符，用于表示字符串的结束。
    szmsg  db 13,10,'hello world!',13,10,'$'
datasg ends

codesg segment
    start: 
           mov ax,datasg
           mov ds,ax
           lea dx,szmsg
           mov ah,9
           int 21h

           mov ax,4c00h
           int 21h
codesg ends
end start