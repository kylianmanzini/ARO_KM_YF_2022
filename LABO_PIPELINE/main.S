init:
mov r0, #1
mov r1, #1

start:
add r0, #1
b end
add r1, #1

end:
bl start
add r1, #1