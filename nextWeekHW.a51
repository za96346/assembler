                            ORG     0000H
                            AJMP    MAIN

; IT0 中斷
                            ORG     0003H
                            AJMP    IT0_ISR

; IT1 中斷
                            ORG     0013H
                            AJMP    IT1_ISR

MAIN:                       SETB    P3.2
                            SETB    IT0
                            SETB    EX0

                            SETB    P3.3
                            SETB    IT1
                            SETB    EX1
                            SETB    EA

                            AJMP    TRAFFIC_LIGHT_START



; IT0 中斷
IT0_ISR:                    
                            PUSH    ACC
                            PUSH    B
                            PUSH    DPL
                            PUSH    DPH
                            PUSH    PSW

                            MOV     R5,     #10

BUSY_TONE_START:            MOV     R6,     #83
                            MOV     R5,     #200
                            ACALL   BUSY_TONE_SOUND
                            ACALL   BUSY_TONE_D05S
                            ACALL   BUSY_TONE_SOUND
                            ACALL   BUSY_TONE_D05S
                            ACALL   BUSY_TONE_SOUND
                            ACALL   BUSY_TONE_D05S

                            POP     PSW
                            POP     DPH
                            POP     DPL
                            POP     B
                            POP     ACC
                            RETI

BUSY_TONE_SOUND:            CLR     P3.6
                            ACALL   BUSY_TONE_DELAY
                            SETB    P2.6
                            ACALL   BUSY_TONE_DELAY
                            DJNZ    R5,     BUSY_TONE_SOUND
                            RET

BUSY_TONE_DELAY:            MOV     B,      R6
BUSY_TONE_DL:               MOV     R7,     #6
                            DJNZ    R7,     $
                            DJNZ    R6,     BUSY_TONE_DL
                            MOV     R6,     B
                            RET

BUSY_TONE_D05S:             MOV     R5,     #5
BUSY_TONE_DL1:              MOV     R6,     #250
BUSY_TONE_DL2:              MOV     R7,     #200
BUSY_TONE_DL3:              DJNZ    R7,     BUSY_TONE_DL3
                            DJNZ    R6,     BUSY_TONE_DL2
                            DJNZ    R5,     BUSY_TONE_DL1
                            RET

; IT1 中斷
IT1_ISR:                    
                            PUSH    ACC
                            PUSH    B
                            PUSH    DPL
                            PUSH    DPH
                            PUSH    PSW

                            MOV     R5,     #10

DOUBLE_SPOTLIGHT_LOOP:      MOV     P0,     #11111111B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111100B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111111B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111100B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111111B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111100B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111111B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111100B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111111B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY
                            MOV     P0,     #11111100B
                            ACALL   DOUBLE_SPOTLIGHT_DELAY

                            POP     PSW
                            POP     DPH
                            POP     DPL
                            POP     B
                            POP     ACC
                            RETI

DOUBLE_SPOTLIGHT_DELAY:     MOV     R6,     #250
DOUBLE_SPOTLIGHT_DL1:       MOV     R7,     #200
DOUBLE_SPOTLIGHT_DL2:       DJNZ    R7,     DOUBLE_SPOTLIGHT_DL2
                            DJNZ    R6,     DOUBLE_SPOTLIGHT_DL1
                            RET

; 交通信
TRAFFIC_LIGHT_START:        MOV     R0,     #TRAFFIC_LIGHT_OK-TRAFFIC_LIGHT_TABLE+1
                            MOV     DPTR,   #TRAFFIC_LIGHT_TABLE
                            MOV     R1,     #00H

TRAFFIC_LIGHT_LOOP:         MOV     A,      R1
                            MOVC    A,      @A+DPTR
                            MOV     P0,     A
                            ACALL   TRAFFIC_LIGHT_DELAY
                            INC     R1
                            DJNZ    R0,     TRAFFIC_LIGHT_LOOP
                            AJMP    TRAFFIC_LIGHT_START

TRAFFIC_LIGHT_DELAY:        MOV     R5,     #1
TRAFFIC_LIGHT_DL1:          MOV     R6,     #250
TRAFFIC_LIGHT_DL2:          MOV     R7,     #200
TRAFFIC_LIGHT_DL3:          DJNZ    R7,     TRAFFIC_LIGHT_DL3
                            DJNZ    R6,     TRAFFIC_LIGHT_DL2
                            DJNZ    R5,     TRAFFIC_LIGHT_DL1
                            RET

TRAFFIC_LIGHT_TABLE:        DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B
                            DB      10000100B

                            DB      10001000B
                            DB      10000000B
                            DB      10001000B
                            DB      10000000B
                            DB      10001000B
                            DB      10000000B

                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B
                            DB      00110000B

                            DB      01010000B
                            DB      00010000B
                            DB      01010000B
                            DB      00010000B
                            DB      01010000B
                            DB      00010000B

TRAFFIC_LIGHT_OK:           DB      00000000B
