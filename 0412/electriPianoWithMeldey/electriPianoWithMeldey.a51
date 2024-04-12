    ORG 0000H
START:  MOV     DPTR, #MUSIC; DPTR
CONT:   CLR     A
        MOVC    A, @A+DPTR
        CJNE    A, #40,CHK
        AJMP    START
CHK:    CJNE    A, #255, OK
STOP:   AJMP    STOP
OK:     PUSH    ACC
        INC     DPTR
        CLR     A
        MOVC    A,@A+DPTR
        MOV     R4, A
        POP     ACC

CHK1:   CJNE    A, #01, CHK2
        ACALL   DOL
CHK2:   CJNE    A, #02, CHK3
        ACALL   REL
CHK3:   CJNE    A, #03, CHK4
        ACALL   MIL
CHK4:   CJNE    A, #04, CHK5
        ACALL   FAL
CHK5:   CJNE    A, #05, CHK6
        ACALL   SOL
CHK6:   CJNE    A, #06, CHK7
        ACALL   LAL
CHK7:   CJNE    A, #07, CHK11
        ACALL   SIL
CHK11:   CJNE    A, #011, CHK12
        ACALL   DO
CHK12:   CJNE    A, #12, CHK13
        ACALL   RE
CHK13:   CJNE    A, #13, CHK14
        ACALL   MI
CHK14:   CJNE    A, #14, CHK15
        ACALL   FA
CHK15:   CJNE    A, #15, CHK16
        ACALL   SO
CHK16:   CJNE    A, #16, CHK17
        ACALL   LA
CHK17:   CJNE    A, #17, CHK21
        ACALL   SI
CHK21:   CJNE    A, #21, CHK22
        ACALL   DOH
CHK22:   CJNE    A, #22, CHK23
        ACALL   REH
CHK23:   CJNE    A, #23, CHK24
        ACALL   MIH
CHK24:   CJNE    A, #24, CHK25
        ACALL   FAH
CHK25:   CJNE    A, #25, CHK26
        ACALL   SOH
CHK26:   CJNE    A, #26, CHK27
        ACALL   LAH
CHK27:   CJNE    A, #27, CHK0
        ACALL   SIH
CHK0:   CJNE    A, #00, CONT2
        ACALL   NON
CONT2:  INC     DPTR
        AJMP    CONT

DOL:    MOV     R6, #254
        MOV     R5, #16
        AJMP    OUTPUT
REL:    MOV     R6, #226
        MOV     R5, #18
        AJMP    OUTPUT
MIL:    MOV     R6, #201
        MOV     R5, #21
        AJMP    OUTPUT
FAL:    MOV     R6, #190
        MOV     R5, #22
        AJMP    OUTPUT
SOL:    MOV     R6, #170
        MOV     R5, #25
        AJMP    OUTPUT
LAL:    MOV     R6, #150
        MOV     R5, #28
        AJMP    OUTPUT
SIL:    MOV     R6, #134
        MOV     R5, #31
        AJMP    OUTPUT
DO:     MOV     R6, #126
        MOV     R5, #33
        AJMP    OUTPUT
RE:     MOV     R6, #113
        MOV     R5, #37
        AJMP    OUTPUT
MI:     MOV     R6, #100
        MOV     R5, #41
        AJMP    OUTPUT
FA:     MOV     R6, #95
        MOV     R5, #44
        AJMP    OUTPUT
SO:     MOV     R6, #85
        MOV     R5, #49
        AJMP    OUTPUT
LA:     MOV     R6, #75
        MOV     R5, #55
        AJMP    OUTPUT
SI:     MOV     R6, #67
        MOV     R5, #62
        AJMP    OUTPUT
DOH:     MOV     R6, #63
        MOV     R5, #65
        AJMP    OUTPUT
REH:     MOV     R6, #56
        MOV     R5, #73
        AJMP    OUTPUT
MIH:     MOV     R6, #50
        MOV     R5, #82
        AJMP    OUTPUT
FAH:     MOV     R6, #47
        MOV     R5, #88
        AJMP    OUTPUT
SOH:     MOV     R6, #42
        MOV     R5, #98
        AJMP    OUTPUT
LAH:     MOV     R6, #37
        MOV     R5, #110
        AJMP    OUTPUT
SIH:     MOV     R6, #33
        MOV     R5, #124
        AJMP    OUTPUT
NON:    MOV     R6, #33
        MOV     R5, #124
        AJMP    OUTPUT

OUTPUT: PUSH    05
LOOP:   CJNE    A, #00, SOUND
        AJMP    MUTE
SOUND:  CLR     P2.6
MUTE:   ACALL   DELAY
        SETB    P2.6
        ACALL   DELAY
        DJNZ    R5, LOOP

        POP     05
        DJNZ    R4, OUTPUT
REST:   MOV     R6, #170
        MOV     R5, #20
WAIT:   ACALL    DELAY
        DJNZ    R5, WAIT
        RET

DELAY:  MOV     B, R6
DL:     MOV     R7, #6
        DJNZ    R7, $
        DJNZ    R6, DL
        MOV     R6, B
        RET

MUSIC:  DB  11,04,11,04,11,04
        DB  13,06,12,02,11,04
        DB  13,04,13,04,13,04
        DB  15,06,14,02,13,04
        DB  15,04,14,04,13,04
        DB  12,08,00,04
        DB  12,08,11,02,07,02
        DB  11,04,12,04,13,04
        DB  14,08,13,02,12,02
        DB  13,04,14,04,15,04
        DB  15,02,14,02,13,04,12,04
        DB  11,08,00,04

        DB  255

        END
