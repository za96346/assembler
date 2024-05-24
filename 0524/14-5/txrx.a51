        ORG     0000H
        AJMP    MAIN

        ORG     0023H
        JNB     RI,     NON
        CLR     RI
RECEV:  MOV     A,      SBUF
        JNB     ACC.0,   CASE5
        JNB     ACC.1,   CASE6
        JNB     ACC.2,   CASE7
        JNB     ACC.3,   CASE8
        AJMP    OK
CASE5:  CLR     P1.0
        MOV     SBUF,   P0
        AJMP    OK
CASE6:  CLR     P1.0
        MOV     SBUF,   P0
        AJMP    OK
CASE7:  CLR     P1.1
        MOV     SBUF,   P0
        AJMP    OK
CASE8:  CLR     P1.1
        MOV     SBUF,   P0
        AJMP    OK
NON:    CLR,    TI
OK:     RETI


MAIN:   MOV     TMOD,   #01110000B
        CLR     RI
        CLR     TI
        SETB    ES
        SETB    EA

LOOP:   JNB     p2.0,   CASE1
        JNB     p2.1,   CASE2
        JNB     p2.2,   CASE3
        JNB     p2.3,   CASE4
        AJMP    LOOP

CASE1:  CLR     P1.0
        AJMP    TRANS
CASE2:  CLR     P1.0
        AJMP    TRANS
CASE3:  CLR     P1.1
        AJMP    TRANS
CASE4:  SETB    P1.1

TRANS:  MOV     SBUF,   P0
WAIT:   CALL    DELAY
        MOV     A,  P1
        CJNE    A,  #11111111B, WAIT
        AJMP    LOOP
DELAY:  MOV     R6,     #250
DL1:    MOV     R7,     #200
DL2:    DJNZ    R7,     DL2
        DJNZ    R6,     DL1
        RET