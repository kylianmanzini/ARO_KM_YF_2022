init:
mov r0, #1
mov r1, #1

start:
add r0, #1
b end
nop
nop
nop
nop
add r1, #1

end:
b start
nop
nop
nop
nop