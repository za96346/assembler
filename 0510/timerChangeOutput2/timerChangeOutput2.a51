        ORG     0000H
        AJMP    MAIN

        ORG     000BH

        CPL     A
        MOV     P0,     A
        RETI

MAIN:   SETB    P3.4
        MOV     TMOD,   #00000110B

        MOV     TH0,#256-5
        MOV     TL0,#256-5
        SETB    EA
        SETB    ET0
        SETB    TR0

        MOV     A,      #00000000B
        MOV     P0,     A

PAUSE:  AJMP    PAUSE

END