init:
mov r0, #0
mov r5, #0
mov r1, #128

bl recursif

b init

.org 0x12
recursif: 

strb r6, [r5]
add r5, #2

strb r1, [r0, #1]
add r0, #2
lsr r1, r1, #1

beq retour

bl recursif

retour:

beq retour
sub r5, #2
ldrb r7, [r5]