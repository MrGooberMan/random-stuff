MOV r1 #1
MOV r2 #1
ADD r3 r1 r2
ADD r4 r2 r3
MOV r5 #0
MOV r6 #0
MOV r0 #0
MOV r0 #0
ADD r5 r5 r1
ADD r5 r5 r2
ADD r5 r5 r3
ADD r5 r5 r4
OUT r5
BRK
