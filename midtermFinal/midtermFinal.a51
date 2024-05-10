    ORG 0000H
MAIN_LOOP:   MOV P1,     #11111110B
        JNB P2.0,   ONE_START_AJMP
        JNB P2.1,   TWO_START_AJMP
        JNB P2.2,   THREE_START_AJMP
        JNB p2.3    FOUR_START_AJMP

        MOV P1,     #11111101B
        JNB P2.0,   FIVE_START_AJMP
        JNB P2.1,   SIX_START_AJMP
        JNB P2.2,   SEVEN_START_AJMP
        JNB P2.3,   EIGHT_START_AJMP

        MOV P1,     #11111011B
        JNB P2.0,   NINE_START_AJMP

        AJMP MAIN_LOOP

ONE_START_AJMP:     AJMP    ONE_START
TWO_START_AJMP:     AJMP    TWO_START
THREE_START_AJMP:   AJMP    THREE_START
FOUR_START_AJMP:    AJMP    FOUR_START
FIVE_START_AJMP:    AJMP    FIVE_START
SIX_START_AJMP:     AJMP    SIX_START
SEVEN_START_AJMP:   AJMP    SEVEN_START
EIGHT_START_AJMP:   AJMP    EIGHT_START
NINE_START_AJMP:    AJMP    NINE_START

;one start
ONE_START: MOV     DPTR, #MUSIC2; DPTR
ONE_CONT:   CLR     A
        MOVC    A, @A+DPTR
        CJNE    A, #40,ONE_CHK

ONE_CHK:    CJNE    A, #255, ONE_OK
ONE_STOP:   AJMP    ONE_STOP
ONE_OK:     PUSH    ACC
        INC     DPTR
        CLR     A
        MOVC    A,@A+DPTR
        MOV     R4, A
        POP     ACC

ONE_CHK1:   CJNE    A, #01, ONE_CHK2
        ACALL   DOL
ONE_CHK2:   CJNE    A, #02, ONE_CHK3
        ACALL   REL
ONE_CHK3:   CJNE    A, #03, ONE_CHK4
        ACALL   MIL
ONE_CHK4:   CJNE    A, #04, ONE_CHK5
        ACALL   FAL
ONE_CHK5:   CJNE    A, #05, ONE_CHK6
        ACALL   SOL
ONE_CHK6:   CJNE    A, #06, ONE_CHK7
        ACALL   LAL
ONE_CHK7:   CJNE    A, #07, ONE_CHK11
        ACALL   SIL
ONE_CHK11:   CJNE    A, #011, ONE_CHK12
        ACALL   DO
ONE_CHK12:   CJNE    A, #12, ONE_CHK13
        ACALL   RE
ONE_CHK13:   CJNE    A, #13, ONE_CHK14
        ACALL   MI
ONE_CHK14:   CJNE    A, #14, ONE_CHK15
        ACALL   FA
ONE_CHK15:   CJNE    A, #15, ONE_CHK16
        ACALL   SO
ONE_CHK16:   CJNE    A, #16, ONE_CHK17
        ACALL   LA
ONE_CHK17:   CJNE    A, #17, ONE_CHK21
        ACALL   SI
ONE_CHK21:   CJNE    A, #21, ONE_CHK22
        ACALL   DOH
ONE_CHK22:   CJNE    A, #22, ONE_CHK23
        ACALL   REH
ONE_CHK23:   CJNE    A, #23, ONE_CHK24
        ACALL   MIH
ONE_CHK24:   CJNE    A, #24, ONE_CHK25
        ACALL   FAH
ONE_CHK25:   CJNE    A, #25, ONE_CHK26
        ACALL   SOH
ONE_CHK26:   CJNE    A, #26, ONE_CHK27
        ACALL   LAH
ONE_CHK27:   CJNE    A, #27, ONE_CHK0
        ACALL   SIH
ONE_CHK0:   CJNE    A, #00, ONE_CONT2
        ACALL   NON
ONE_CONT2:  INC     DPTR
        AJMP    ONE_CONT


ONE_OUTPUT: PUSH    05
ONE_LOOP:   CJNE    A, #00, ONE_SOUND
        AJMP    ONE_MUTE
ONE_SOUND:  CLR     P2.6
ONE_MUTE:   ACALL   ONE_DELAY
        SETB    P2.6
        ACALL   ONE_DELAY
        DJNZ    R5, ONE_LOOP

        POP     05
        DJNZ    R4, ONE_OUTPUT
ONE_REST:   MOV     R6, #170
        MOV     R5, #20
ONE_WAIT:   ACALL    ONE_DELAY
        DJNZ    R5, ONE_WAIT
        RET

ONE_DELAY:  MOV     B, R6
ONE_DL:     MOV     R7, #6
        DJNZ    R7, $
        DJNZ    R6, ONE_DL
        MOV     R6, B
        RET

MUSIC2:  DB  11

; two start
TWO_START:    MOV     R6,     #83
                MOV     R5,     #200
                ACALL   SOUND
                ACALL   TWO_D05S
                AJMP    TWO_START

SOUND:          CLR     P2.6
                ACALL   TWO_DELAY
                SETB    P2.6
                ACALL   TWO_DELAY
                DJNZ    R5, SOUND
                RET

TWO_DELAY:    MOV     B,      R6
TWO_DL:       MOV     R7,     #6
                DJNZ    R7,     $
                DJNZ    R6,     TWO_DL
                MOV     R6,     B
                RET

TWO_D05S:     MOV     R5,     #5
TWO_DL1:      MOV     R6,     #250
TWO_DL2:      MOV     R7,     #200
TWO_DL3:      DJNZ    R7,     TWO_DL3
                DJNZ    R6,     TWO_DL2
                DJNZ    R5,     TWO_DL1
                RET

; three start
THREE_START:      MOV	    R0,	    #THREEOK-THREETABLE+1
                MOV	    DPTR,   #THREETABLE
                MOV	    R1,     #00H

THREELOOP:	    MOV	    A,      R1
                MOVC	A,      @A+DPTR
                MOV	    P0,     A
                ACALL	THREEDELAY
                INC	    R1
                DJNZ	R0,     THREELOOP
                AJMP	THREE_START

THREEDELAY:	    MOV	    R5,     #1
THREEDL1:	    MOV	    R6,     #250
THREEDL2:	    MOV	    R7,     #200
THREEDL3:	    DJNZ	R7,     THREEDL3
		        DJNZ	R6,     THREEDL2
		        DJNZ	R5,     THREEDL1
		        RET

THREETABLE:	DB	00001011B


THREEOK:		DB	00001100B

; four start
FOUR_START: MOV     DPTR, #MUSIC; DPTR
CONT:   CLR     A
        MOVC    A, @A+DPTR
        CJNE    A, #40,CHK
        AJMP    FOUR_START
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
FOUR_LOOP:   CJNE    A, #00, FOUR_SOUND
        AJMP    MUTE
FOUR_SOUND:  CLR     P2.6
MUTE:   ACALL   FOUR_DELAY
        SETB    P2.6
        ACALL   FOUR_DELAY
        DJNZ    R5, FOUR_LOOP

        POP     05
        DJNZ    R4, OUTPUT
REST:   MOV     R6, #170
        MOV     R5, #20
WAIT:   ACALL    FOUR_DELAY
        DJNZ    R5, WAIT
        RET

FOUR_DELAY:  MOV     B, R6
FOUR_DL:     MOV     R7, #6
        DJNZ    R7, $
        DJNZ    R6, FOUR_DL
        MOV     R6, B
        RET

MUSIC:  DB  15,04,13,04,13,04
        DB  14,04,12,04,12,04
        DB  11,04,12,04,13,04
        DB  14,04,15,04,15,04
        DB  15,04,15,04,13,04

        DB  13,04,14,04,12,04
        DB  12,04,11,04,13,04
        DB  15,04,15,04,11,04
        DB  12,04,12,04,12,04
        DB  12,04,12,04,13,04
        DB  14,04,13,04,13,04
        DB  13,04,13,04,13,04
        DB  14,04,15,04,15,04
        DB  13,04,13,04,14,04
        DB  12,04,12,04,11,04
        DB  13,04,15,04,15,04
        DB  11,04

        DB  255
; four end

; five start
FIVE_START: MOV     DPTR, #MUSIC3; DPTR
FIVE_CONT:   CLR     A
        MOVC    A, @A+DPTR
        CJNE    A, #40,FIVE_CHK
        AJMP    FIVE_START

FIVE_CHK:    CJNE    A, #255, FIVE_OK
FIVE_STOP:   AJMP    FIVE_STOP
FIVE_OK:     PUSH    ACC
        INC     DPTR
        CLR     A
        MOVC    A,@A+DPTR
        MOV     R4, A
        POP     ACC

FIVE_CHK1:   CJNE    A, #01, FIVE_CHK2
        ACALL   DOL
FIVE_CHK2:   CJNE    A, #02, FIVE_CHK3
        ACALL   REL
FIVE_CHK3:   CJNE    A, #03, FIVE_CHK4
        ACALL   MIL
FIVE_CHK4:   CJNE    A, #04, FIVE_CHK5
        ACALL   FAL
FIVE_CHK5:   CJNE    A, #05, FIVE_CHK6
        ACALL   SOL
FIVE_CHK6:   CJNE    A, #06, FIVE_CHK7
        ACALL   LAL
FIVE_CHK7:   CJNE    A, #07, FIVE_CHK11
        ACALL   SIL
FIVE_CHK11:   CJNE    A, #011, FIVE_CHK12
        ACALL   DO
FIVE_CHK12:   CJNE    A, #12, FIVE_CHK13
        ACALL   RE
FIVE_CHK13:   CJNE    A, #13, FIVE_CHK14
        ACALL   MI
FIVE_CHK14:   CJNE    A, #14, FIVE_CHK15
        ACALL   FA
FIVE_CHK15:   CJNE    A, #15, FIVE_CHK16
        ACALL   SO
FIVE_CHK16:   CJNE    A, #16, FIVE_CHK17
        ACALL   LA
FIVE_CHK17:   CJNE    A, #17, FIVE_CHK21
        ACALL   SI
FIVE_CHK21:   CJNE    A, #21, FIVE_CHK22
        ACALL   DOH
FIVE_CHK22:   CJNE    A, #22, FIVE_CHK23
        ACALL   REH
FIVE_CHK23:   CJNE    A, #23, FIVE_CHK24
        ACALL   MIH
FIVE_CHK24:   CJNE    A, #24, FIVE_CHK25
        ACALL   FAH
FIVE_CHK25:   CJNE    A, #25, FIVE_CHK26
        ACALL   SOH
FIVE_CHK26:   CJNE    A, #26, FIVE_CHK27
        ACALL   LAH
FIVE_CHK27:   CJNE    A, #27, FIVE_CHK0
        ACALL   SIH
FIVE_CHK0:   CJNE    A, #00, FIVE_CONT2
        ACALL   NON
FIVE_CONT2:  INC     DPTR
        AJMP    FIVE_CONT


FIVE_OUTPUT: PUSH    05
FIVE_LOOP:   CJNE    A, #00, FIVE_SOUND
        AJMP    FIVE_MUTE
FIVE_SOUND:  CLR     P2.6
FIVE_MUTE:   ACALL   FIVE_DELAY
        SETB    P2.6
        ACALL   FIVE_DELAY
        DJNZ    R5, FIVE_LOOP

        POP     05
        DJNZ    R4, FIVE_OUTPUT
FIVE_REST:   MOV     R6, #170
        MOV     R5, #20
FIVE_WAIT:   ACALL    FIVE_DELAY
        DJNZ    R5, FIVE_WAIT
        RET

FIVE_DELAY:  MOV     B, R6
FIVE_DL:     MOV     R7, #6
        DJNZ    R7, $
        DJNZ    R6, FIVE_DL
        MOV     R6, B
        RET

MUSIC3:  DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04
            DB  15,04,11,04

; six start
SIX_START:      MOV	    R0,	    #SIX_OK-SIX_TABLE+1
                MOV	    DPTR,   #SIX_TABLE
                MOV	    R1,     #00H

SIX_LOOP:	    MOV	    A,      R1
                MOVC	A,      @A+DPTR
                MOV	    P0,     A
                ACALL	SIX_DELAY
                INC	    R1
                DJNZ	R0,     SIX_LOOP
                AJMP	SIX_START

SIX_DELAY:	    MOV	    R5,     #1
SIX_DL1:	    MOV	    R6,     #250
SIX_DL2:	    MOV	    R7,     #200
SIX_DL3:	    DJNZ	R7,     SIX_DL3
		        DJNZ	R6,     SIX_DL2
		        DJNZ	R5,     SIX_DL1
		        RET

SIX_TABLE:	DB	10000100B
            DB	00000100B
            DB	10000100B
            DB	00000100B
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
            DB	10001000B
            DB	10001000B

            DB	00110000B
            DB	00100000B
            DB	00110000B
            DB	00100000B
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
            DB	01010000B
            DB	01010000B

SIX_OK:		DB	00000000B
; six end

; seven start
SEVEN_START:      MOV	    R0,	    #SEVEN_OK-SEVEN_TABLE+1
                MOV	    DPTR,   #SEVEN_TABLE
                MOV	    R1,     #00H

SEVEN_LOOP:	    MOV	    A,      R1
                MOVC	A,      @A+DPTR
                MOV	    P0,     A
                ACALL	SEVEN_DELAY
                INC	    R1
                DJNZ	R0,     SEVEN_LOOP

SEVEN_DELAY:	    MOV	    R5,     #3
SEVEN_DL1:	    MOV	    R6,     #250
SEVEN_DL2:	    MOV	    R7,     #200
SEVEN_DL3:	    DJNZ	R7,     SEVEN_DL3
		        DJNZ	R6,     SEVEN_DL2
		        DJNZ	R5,     SEVEN_DL1
		        RET

SEVEN_TABLE:	DB	1000001B
                DB	00000000B
                DB	1000001B
                DB	00000000B
                DB	1000001B
                DB	00000000B
                DB	1000001B
                DB	00000000B
SEVEN_OK:                DB	1000001B



;EIGHT start
EIGHT_START:      MOV 	R1,	#07H
		        MOV 	A, 	#00000001B

EIGHT_LEFT: 	    MOV 	P0, 	A
                ACALL   EIGHT_DELAY
                RL 	    A
                DJNZ 	R1, 	EIGHT_LEFT
                MOV 	R1,  	#07H
                MOV 	A, 	    #10000000B

EIGHT_RIGHT: 	    MOV 	P0,	A
                ACALL   EIGHT_DELAY
                RR 	    A
                DJNZ 	R1,	EIGHT_RIGHT
                AJMP 	EIGHT_START

EIGHT_DELAY: 	    MOV 	R6, 	#250
EIGHT_DL1: 		MOV 	R7, 	#200
EIGHT_DL2: 		DJNZ 	R7, 	EIGHT_DL2
		        DJNZ 	R6, 	EIGHT_DL1
		        RET
; EIGHT end

; nine start
NINE_START:  MOV 	R0,	#NINE_OK - NINE_TABLE + 1
            MOV 	DPTR, 	#NINE_TABLE
            MOV		R1,	#00H

NINE_LOOP:	MOV		A, 	R1
		MOVC 	A, @A+DPTR
		MOV		P0,	A
		ACALL	NINE_DELAY
		INC		R1

		DJNZ	R0, NINE_LOOP
		AJMP	NINE_START

NINE_DELAY:	MOV		R5, #2
NINE_DL1:	MOV		R6, #250
NINE_DL2:	MOV		R7,	#200
NINE_DL3:	DJNZ 	R7, NINE_DL3
		DJNZ	R6, NINE_DL2
		DJNZ	R5, NINE_DL1
		RET

NINE_TABLE:	DB		10000001B
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
NINE_OK:		DB		11111111B