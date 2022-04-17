debut:
    bl f1
    sub r5, r5, #2

    b fin

f1:
    strh r6, [r5, #0]

    mov r0, #10
    mov r1, #20
    mov r2, #30
    mov r3, #40

    bl f2
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6

f2:
    add r5, r5, #2
    strh r6, [r5, #0]

    sub r4, r3, r1
    and r4, r1

    beq equal


    bl f3
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6

equalF2:

    b f2

f3:
    add r5, r5, #2
    strh r6, [r5, #0]

    add r0, r0

    bl f4
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6

equalF3:

    b f3

f4:
    add r5, r5, #2
    strh r6, [r5, #0]

    mov r4, #24
    lsr r4, r2

    bl f5
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6

f5:
    add r5, r5, #2
    strh r6, [r5, #0]

    orr r1, r4

    bl f6
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6

f6:
    add r5, r5, #2
    strh r6, [r5, #0]

    eor r1, r4

    bl f7
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6


f7:
    add r5, r5, #2
    strh r6, [r5, #0]

    mvn r1, r4

    bl f8
    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6


f8:
    add r5, r5, #2
    strh r6, [r5, #0]

    mov r0, #0
    mov r1, #0
    mov r2, #0
    mov r3, #0

    sub r5, r5, #2

    ldrh r6, [r5, #0]
    mov r7, r6

fin:
    b debut