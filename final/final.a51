    ORG     0000H
TEST:   MOV P1, #11111110B
        JNB P2.0, SOL
        JNB P2.1, LAL
        JNB P2.2, SIL
        JNB P2.3, DO

        MOV P1, #11111101B
        JNB P2.0, RE
        JNB P2.1, MI
        JNB P2.2, FA
        JNB P2.3, SO

        MOV P1, #11111011B
        JNB P2.0, LA
        JNB P2.1, SI
        JNB P2.2, DOH

        AJMP  TEST

SOL:    MOV   R6, #170
        AJMP  OUTPUT
LAL:    MOV   R6, #150
        AJMP  OUTPUT
SIL:    MOV   R6, #134
        AJMP  OUTPUT
DO:     MOV   R6, #126
        AJMP  OUTPUT
RE:     MOV   R6, #113
        AJMP  OUTPUT
MI:     MOV   R6, #100
        AJMP  OUTPUT
FA:     MOV   R6, #95
        AJMP  OUTPUT
SO:     MOV   R6, #85
        AJMP  OUTPUT
LA:     MOV   R6, #75
        AJMP  OUTPUT
SI:     MOV   R6, #67
        AJMP  OUTPUT
DOH:    MOV   R6, #63
        AJMP  OUTPUT

OUTPUT: CLR P2.6
        ACALL START
        ACALL DELAY2
        SETB P2.6
        ACALL DELAY2
        AJMP TEST

DELAY2:  MOV B, R6
DL:     MOV R7, #6
        DJNZ R7, $
        DJNZ R6, DL
        MOV  R6, B
        RET
;


;;;  matrix light
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
TABLE:  DB      10011111B
        DB      10011111B
        DB      11001111B
        DB      10000111B
        DB      11100111B
        DB      11001011B
        DB      11011101B
        DB      10011001B