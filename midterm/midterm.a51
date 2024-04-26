    ORG 0000H
MAIN_LOOP:   MOV P1,     #11111110B
        JNB P2.0,   ONE_START_AJMP
        JNB P2.1,   TWO_START_AJMP
        JNB P2.2,   THREE_START_AJMP
        JNB p2.3    FOUR_START_AJMP

        MOV P1,     #11111101B
        JNB P2.0,   FIVE_START_AJMP
        JNB P2.1,   SIX_START_AJMP
        ;JNB P2.2,   SEVEN_START_AJMP
        ;JNB P2.3,   EIGHT_START_AJMP

        ;MOV P1,     #11111011B
        ;JNB P2.0,   NINE_START_AJMP

        AJMP MAIN_LOOP

ONE_START_AJMP:     AJMP    ONE_START
TWO_START_AJMP:     AJMP    TWO_START
THREE_START_AJMP:   AJMP    THREE_START
FOUR_START_AJMP:    AJMP    FOUR_START
FIVE_START_AJMP:    AJMP    FIVE_START
SIX_START_AJMP:     AJMP    SIX_START
;SEVEN_START_AJMP:   AJMP    SEVEN_START
;EIGHT_START_AJMP:   AJMP    EIGHT_START
;NINE_START_AJMP:    AJMP    NINE_START

; one
ONE_START:      MOV 	R1,	#07H
		        MOV 	A, 	#00000001B

ONE_LEFT: 	    MOV 	P0, 	A
                ACALL   ONE_DELAY
                RL 	    A
                DJNZ 	R1, 	ONE_LEFT
                MOV 	R1,  	#07H
                MOV 	A, 	    #10000000B

ONE_RIGHT: 	    MOV 	P0,	A
                ACALL   ONE_DELAY
                RR 	    A
                DJNZ 	R1,	ONE_RIGHT
                AJMP 	ONE_START

ONE_DELAY: 	    MOV 	R6, 	#250
ONE_DL1: 		MOV 	R7, 	#200
ONE_DL2: 		DJNZ 	R7, 	ONE_DL2
		        DJNZ 	R6, 	ONE_DL1
		        RET

; two
TWO_START:      MOV	    R0,	    #TWO_OK-TWO_TABLE+1
                MOV	    DPTR,   #TWO_TABLE
                MOV	    R1,     #00H

TWO_LOOP:	    MOV	    A,      R1
                MOVC	A,      @A+DPTR
                MOV	    P0,     A
                ACALL	TWO_DELAY
                INC	    R1
                DJNZ	R0,     TWO_LOOP
                AJMP	TWO_START

TWO_DELAY:	    MOV	    R5,     #1
TWO_DL1:	    MOV	    R6,     #250
TWO_DL2:	    MOV	    R7,     #200
TWO_DL3:	    DJNZ	R7,     TWO_DL3
		        DJNZ	R6,     TWO_DL2
		        DJNZ	R5,     TWO_DL1
		        RET

TWO_TABLE:	DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B
            DB	10000100B

            DB	10001000B
            DB	10000000B
            DB	10001000B
            DB	10000000B
            DB	10001000B
            DB	10000000B

            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B
            DB	00110000B

            DB	01010000B
            DB	00010000B
            DB	01010000B
            DB	00010000B
            DB	01010000B
            DB	00010000B

TWO_OK:		DB	00000000B

; three
THREE_START:    MOV     R6,     #83
                MOV     R5,     #200
                ACALL   SOUND
                ACALL   THREE_D05S
                AJMP    THREE_START

SOUND:          CLR     P2.6
                ACALL   THREE_DELAY
                SETB    P2.6
                ACALL   THREE_DELAY
                DJNZ    R5, SOUND
                RET

THREE_DELAY:    MOV     B,      R6
THREE_DL:       MOV     R7,     #6
                DJNZ    R7,     $
                DJNZ    R6,     THREE_DL
                MOV     R6,     B
                RET

THREE_D05S:     MOV     R5,     #5
THREE_DL1:      MOV     R6,     #250
THREE_DL2:      MOV     R7,     #200
THREE_DL3:      DJNZ    R7,     THREE_DL3
                DJNZ    R6,     THREE_DL2
                DJNZ    R5,     THREE_DL1
                RET

; four
FOUR_START: MOV P1, #11111110B
            JNB P2.0, FOUR_SOL
            JNB P2.1, FOUR_LAL
            JNB P2.2, FOUR_SIL
            JNB P2.3, FOUR_DO

            MOV P1, #11111101B
            JNB P2.0, FOUR_RE
            JNB P2.1, FOUR_MI
            JNB P2.2, FOUR_FA
            JNB P2.3, FOUR_SO

            MOV P1, #11111011B
            JNB P2.0, FOUR_LA
            JNB P2.1, FOUR_SI
            JNB P2.2, FOUR_DOH

            AJMP  FOUR_START

FOUR_OUTPUT: CLR P2.6
        ACALL   FOUR_DELAY
        SETB    P2.6
        ACALL   FOUR_DELAY
        AJMP    FOUR_START

FOUR_SOL:   MOV   R6, #170
            AJMP  FOUR_OUTPUT
FOUR_LAL:   MOV   R6, #150
            AJMP  FOUR_OUTPUT
FOUR_SIL:   MOV   R6, #134
            AJMP  FOUR_OUTPUT
FOUR_DO:    MOV   R6, #126
            AJMP  FOUR_OUTPUT
FOUR_RE:    MOV   R6, #113
            AJMP  FOUR_OUTPUT
FOUR_MI:    MOV   R6, #100
            AJMP  FOUR_OUTPUT
FOUR_FA:    MOV   R6, #95
            AJMP  FOUR_OUTPUT
FOUR_SO:    MOV   R6, #85
            AJMP  FOUR_OUTPUT
FOUR_LA:    MOV   R6, #75
            AJMP  FOUR_OUTPUT
FOUR_SI:    MOV   R6, #67
            AJMP  FOUR_OUTPUT
FOUR_DOH:   MOV   R6, #63
            AJMP  FOUR_OUTPUT

FOUR_DELAY: MOV     B,  R6
FOUR_DL:    MOV     R7, #6
            DJNZ    R7, $
            DJNZ    R6, FOUR_DL
            MOV     R6, B
            RET

; five
FIVE_START: MOV     DPTR, #MUSIC; DPTR
CONT:   CLR     A
        MOVC    A, @A+DPTR
        CJNE    A, #40,CHK
        AJMP    FIVE_START
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
FIVE_LOOP:   CJNE    A, #00, FIVE_SOUND
        AJMP    MUTE
FIVE_SOUND:  CLR     P2.6
MUTE:   ACALL   FIVE_DELAY
        SETB    P2.6
        ACALL   FIVE_DELAY
        DJNZ    R5, FIVE_LOOP

        POP     05
        DJNZ    R4, OUTPUT
REST:   MOV     R6, #170
        MOV     R5, #20
WAIT:   ACALL    FIVE_DELAY
        DJNZ    R5, WAIT
        RET

FIVE_DELAY:  MOV     B, R6
FIVE_DL:     MOV     R7, #6
        DJNZ    R7, $
        DJNZ    R6, FIVE_DL
        MOV     R6, B
        RET

MUSIC:  DB  15,04,13,04,13,04
        DB  14,06,12,02,12,04
        DB  11,04,12,04,13,04
        DB  14,06,15,02,15,04
        DB  15,04,15,04,15,04

        DB  15,04,13,04,13,04
        DB  14,06,12,02,12,04
        DB  11,04,13,04,15,04
        DB  15,06,11,02,11,04


        DB  255

; six
SIX_START:  MOV 	R0,	#SIX_OK - SIX_TABLE + 1
            MOV 	DPTR, 	#SIX_TABLE
            MOV		R1,	#00H

SIX_LOOP:	MOV		A, 	R1
		MOVC 	A, @A+DPTR
		MOV		P0,	A
		ACALL	SIX_DELAY
		INC		R1

		DJNZ	R0, SIX_LOOP
		AJMP	SIX_START

SIX_DELAY:	MOV		R5, #2
SIX_DL1:	MOV		R6, #250
SIX_DL2:	MOV		R7,	#200
SIX_DL3:	DJNZ 	R7, SIX_DL3
		DJNZ	R6, SIX_DL2
		DJNZ	R5, SIX_DL1
		RET

SIX_TABLE:	DB		10000001B
		DB		11000011B
		DB		11100111B
		DB		11111111B
		DB		11100111B
		DB		11000011B
		DB		10000001B
		DB		00000000B

		DB		10000001B
		DB		11000011B
		DB		11100111B
		DB		11111111B
		DB		11100111B
		DB		11000011B
		DB		10000001B
		DB		00000000B

		DB		11111111B
		DB		00000000B
		DB		11111111B
SIX_OK:		DB		00000000B