
.org 0x00
ADR_saut_1:
    mov r1, #1
    mov r2, #2

.org 0x10
ADR_saut_2:
    lsl r1, r5, #1 
    lsr r5, r5, #1 
    asr r0, r5, #1  

.org 0x20
ADR_saut_3:
    add r3, r1, r2 
    add r3, r1, #1 
    sub r4, r1, r2 
    sub r4, r1, #1 
    add r3, #1 
    sub r4, #1 

.org 0x40
ADR_saut_4:
    and r1, r2
    eor r1, r2
    lsl r1, r2
    lsr r1, r2
    asr r1, r2
    ror r1, r2
    neg r1, r2
    orr r1, r2
    mvn r1, r2

.org 0x60
ADR_saut_5:
    strb r1, [r3, r4]
    ldrb r1, [r3, r4]
    strh r1, [r3, r4]
    ldrh r1, [r3, r4]

    strb r1, [r3, #0]
    ldrb r1, [r3, #0]
    strh r1, [r3, #0]
    ldrh r1, [r3, #0]

.org 0x80
ADR_saut_6:
    beq ADR_saut_1
    bl ADR_saut_1
    b ADR_saut_1
