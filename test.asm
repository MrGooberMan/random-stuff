MOV r1 #2
MOV r2 #1
MOV r3 #8
MUL r2 r2 r1
CMP r2 r3
JC #3 #4
MOV r1 #5
MOV r3 #1
ADD r2 r2 r1
SUB r1 r1 r3
CMP r1 #0
JC #1 #1
OUT r2
BRK
