    .org 0x00
    ADR_saut_1:
    lsl r1, r2, #1
    lsr r1, r2, #1
    asr r1, r2, #1
    add r3, r1, r2 
    add r3, r1, #1 
    sub r4, r1, r2 
    sub r4, r1, #1 
    mov r1, #1
    add r3, #1 
    sub r4, #1 
    and r1, r2
    eor r1, r2
    lsl r1, r2 
    lsr r2, r2 
    asr r0, r2
    ror r1, r2
    neg r1, r2
    orr r1, r2
    mvn r1, r2
    strb r1, [r3, r4]
    ldrb r1, [r3, r4]
    
    strh r1, [r3, r4]
    ldrh r1, [r3, r4]
    
    strb r1, [r3, #0]
    ldrb r1, [r3, #0]
    strh r1, [r3, #0]
    ldrh r1, [r3, #0]
    
    beq ADR_saut_2
    ADR_saut_2:
    b ADR_saut_1