init:
mov r0, #1
mov r1, #1

start:
add r0, #1
ldrb r0, [r0, #1]
eor r1, r0, r1
b end
add r1, #1

end:
bl start
add r1, #1