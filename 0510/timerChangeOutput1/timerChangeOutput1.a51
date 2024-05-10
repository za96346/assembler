        ORG     0000H
        SETB    P3.4
        MOV     TMOD,   #00000110B

        MOV     TH0,    #256-5
        MOV     TL0,    #256-5
        SETB    TR0

LOOP:   MOV     P0,     #00000000B
        ACALL   COUNTER
        MOV     P0,     #11111111B
        ACALL   COUNTER
        AJMP    LOOP

COUNTER:    JB  TF0,    OK
            AJMP    COUNTER

OK:     CLR     TF0
        RET

        END