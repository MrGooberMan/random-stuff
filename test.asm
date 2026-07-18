MOV r1 #10
MOV r2 #0
MOV r3 #1
CMP r1 r2
JC #1 #6
ADD r2 r2 r1
SUB r1 r1 r3
JC #6 #4
OUT r2
BRK
