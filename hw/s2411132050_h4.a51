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
        ACALL DELAY
        SETB P2.6
        ACALL DELAY
        AJMP TEST

DELAY:  MOV B, R6
DL:     MOV R7, #6
        DJNZ R7, $
        DJNZ R6, DL
        MOV  R6, B
        RET
;
        END