    ORG     0000H
    MOV     TMOD,   #00100000B
    MOV     TH1,    #230
    MOV     TL1,    #230
    SETB    TR1
    MOV     SCON,   #010000000B

LOOP:   CLR     TI
        MOV     SBUF,   P1
WAIT:   JNB     TI,     WAIT
        ACALL   DELAY
        AJMP    LOOP

DELAY:  MOV     R6,     #250
DL1:    MOV     R7,     #200
DL2:    DJNZ    R7,     DL2
        DJNZ    R6,     DL1
        RET