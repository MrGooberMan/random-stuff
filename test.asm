MOV r1 #5
MOV r2 #3
MOV r3 #1
ADD r0 r1 r2
SUB r1 r1 r3
CMP r1 r3
JC #2 #4
MUL r0 r0 r2
ADD r0 r0 r1
MOV r3 #2
MUL r0 r0 r3
SUB r2 r2 #1
JC #1 #3
OUT r0
BRK
