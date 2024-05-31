        ORG     0000H
START:  MOV     DPTR,   #TABLE
        MOV     R3,     #2

LOOP:   MOV     R2,     #10
SCAN:   ACALL   SCAN1
        DJNZ    R2,     SCAN

        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR
        INC     DPTR

        DJNZ    R3,     LOOP
        AJMP    START

SCAN1:  MOV     R1,     #00H
        MOV     R5,     #11111110B
        MOV     R4,     #08

LOOP1:  MOV     A,      R1
        MOVC    A,      @A+DPTR
        MOV     P1,     A
        MOV     P0,     R5
        MOV     R6,     #8

DL1:    MOV     R7,     #200
DL2:    DJNZ    R7,     DL2
        DJNZ    R6,     DL1
        ORL     P0,     #00000000B

        MOV     A,      R5
        RL      A
        MOV     R5,     A
        INC     R1
        DJNZ    R4,     LOOP1
        RET

TABLE:  DB      10011111B
        DB      10011111B
        DB      11001111B
        DB      10000111B
        DB      11100111B
        DB      11001011B
        DB      11011101B
        DB      10011001B

;2
        DB      10011111B
        DB      10011111B
        DB      11001111B
        DB      10000011B
        DB      10100101B
        DB      11001011B
        DB      10011101B
        DB      10111101B

;3
        DB      10011111B
        DB      10011111B
        DB      11001111B
        DB      10000011B
        DB      01001101B
        DB      11100111B
        DB      10011001B
        DB      11111101B

;4
        DB      00111111B
        DB      00111111B
        DB      10000111B
        DB      10011101B
        DB      01001111B
        DB      11010111B
        DB      00111001B
        DB      11111101B

;5
        DB      00111111B
        DB      00111111B
        DB      10011111B
        DB      10000111B
        DB      01001011B
        DB      11000101B
        DB      11011001B
        DB      00011101B

;6
        DB      00111111B
        DB      00111111B
        DB      10011111B
        DB      10000111B
        DB      01001011B
        DB      11001101B
        DB      10110011B
        DB      00111011B

;7
        DB      00111111B
        DB      00111111B
        DB      10011111B
        DB      10000111B
        DB      10001011B
        DB      11001111B
        DB      10100111B
        DB      11010111B

;8 
        DB      10011111B
        DB      10011111B
        DB      11001111B
        DB      11000111B
        DB      11100111B
        DB      11101011B
        DB      11100011B
        DB      11111011B