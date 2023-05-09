assume cs:code
code segment
          MOV  ax,0         ;累加的结果
          mov  cx,236       ;
     s:   add  ax,123
          LOOP s
          mov  ax,4c00h
          int  21h
code ends
end