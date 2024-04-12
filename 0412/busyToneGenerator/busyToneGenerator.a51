    ORG     0000H
START:  MOV R6, #83
        MOV R5, #200
        ACALL SOUND
        ACALL D05S
        AJMP  START

SOUND:  CLR     P2.6
        ACALL   DELAY
        SETB    P2.6
        ACALL   DELAY
        DJNZ    R5, SOUND
        RET
DELAY:  MOV     B, R6
DL:     MOV     R7, #6
        DJNZ    R7, $
        DJNZ    R6, DL
        MOV     R6, B
        RET
D05S:   MOV     R5, #5
DL1:    MOV     R6, #250
DL2:    MOV     R7, #200
DL3:    DJNZ    R7, DL3
        DJNZ    R6, DL2
        DJNZ    R5, DL1
        RET
        
        END