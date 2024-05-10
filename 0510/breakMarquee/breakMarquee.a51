        ORG     0000H
        AJMP    MAIN

        ORG     000BH

        MOV     TH0,    #3CH
        MOV     TL0,    #0B0H
        DJNZ    R4,     CONT

        MOV     R4,     CONT
        RL      A
        MOV     P0,     A

CONT:   RETI

MAIN:   MOV     A,      #11111110B
        MOV     P0,     A

        MOV     R4,     #10

        MOV     TMOD,   #00000001B
        MOV     TH0,    #3CH
        MOV     TL0,    #0B0H
        SETB    EA
        SETB    ET0
        SETB    TR0

PAUSE:  AJMP    PAUSE

        END