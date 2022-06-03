init:
mov r0, #0
mov r1, #1
mov r2, #2

ONE:
ldrb r0, [r0,#1]
add r0, #1
b TWO
sub r1, #1
sub r2, #1

TWO:
lsl r1, #1
b THREE
sub r1, #1
sub r2, #1

THREE:
bl init
sub r1, #1
sub r2, #1
