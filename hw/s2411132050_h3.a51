    ORG 0000H
LOOP:   MOV P1, #11111110B
        JNB P2.0, KEY0
        JNB P2.1, KEY1
        JNB P2.2, KEY2
        JNB P2.3, KEY3

        MOV P1, #11111101B
        JNB P2.0, KEY4
        JNB P2.1, KEY5
        JNB P2.2, KEY6
        JNB P2.3, KEY7

        MOV P1, #11111011B
        JNB P2.0, KEY8
        JNB P2.1, KEY9
        JNB P2.2, KEYA
        JNB P2.3, KEYB

        MOV P1, #11110111B
        JNB P2.0, KEYC
        JNB P2.1, KEYD
        JNB P2.2, KEYE
        JNB P2.3, KEYF

        AJMP LOOP
    
KEY0:   MOV P0, #00000000B
        AJMP    LOOP

KEY1:   MOV P0, #00000001B
        AJMP    LOOP

KEY2:   MOV P0, #00000010B
        AJMP    LOOP

KEY3:   MOV P0, #00000011B
        AJMP    LOOP

KEY4:   MOV P0, #00000100B
        AJMP    LOOP

KEY5:   MOV P0, #00000101B
        AJMP    LOOP

KEY6:   MOV P0, #00000110B
        AJMP    LOOP

KEY7:   MOV P0, #00000111B
        AJMP    LOOP

KEY8:   MOV P0, #00001000B
        AJMP    LOOP

KEY9:   MOV P0, #00001001B
        AJMP    LOOP

KEYA:   MOV P0, #00001010B
        AJMP    LOOP

KEYB:   MOV P0, #00001011B
        AJMP    LOOP

KEYC:   MOV P0, #00001100B
        AJMP    LOOP

KEYD:   MOV P0, #00001101B
        AJMP    LOOP

KEYE:   MOV P0, #00001110B
        AJMP    LOOP

KEYF:   MOV P0, #00001111B
        AJMP    LOOP

        END