ORG     0000H
START:  
        MOV DPTR, #TABLE8      ; 將 DPTR 指向 TABLE8
        ACALL DISPLAY_TABLE    ; 呼叫顯示表格子程式
        AJMP START             ; 無限循環，重新開始

DISPLAY_TABLE:
        MOV R2, #8             ; 假設 TABLE8 有 8 行
DISPLAY_LOOP:
        MOVC A, @A+DPTR
        MOV P1, A
        INC DPTR
        ACALL DELAY
        DJNZ R2, DISPLAY_LOOP
        RET

DELAY:
        MOV R6, #50            ; 延遲值
DELAY_LOOP:
        MOV R7, #200
DELAY_INNER_LOOP:
        DJNZ R7, DELAY_INNER_LOOP
        DJNZ R6, DELAY_LOOP
        RET

TABLE8:  
        DB 10011111B
        DB 10011111B
        DB 11001111B
        DB 11000111B
        DB 11100111B
        DB 11101011B
        DB 11100011B
        DB 11111011B
