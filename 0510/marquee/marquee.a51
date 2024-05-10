        ORG 0000H
        MOV     A,      #11111110B
LOOP:   MOV     P0,     A
        ACALL   DELAY
        RL      A
        AJMP    LOOP

DELAY:  MOV     R4,     #10
        MOV     TMOD,   #00000001B

TIMER:  MOV     TH0,    #3CH
        MOV     TL0,    #0B0H
        SETB    TR0

WAIT:   JB      TF0,    OK
        AJMP    WAIT

OK:     CLR     TF0
        DJNZ    R4,     TIMER
        RET
;
        END