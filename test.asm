MOV r1 #60
MOV r2 #2
MOV r3 #0
MOV r4 #0
MOV r5 #0
MOV r6 #0
MOV r0 #0
MOV r0 #0
CMP r1 #1
JC #0 #7
DIV r7 r1 r2
MUL r0 r7 r2
CMP r1 r0
JC #0 #1
ADD r2 r2 #1
JC #6 #1
MOV r1 r7
OUT r2
ADD r3 r3 #1
ADD r4 r4 r2
CMP r5 #0
JC #0 #7
JC #6 #1
MOV r5 r2
MOV r6 r2
CMP r2 r6
JC #2 #4
JC #6 #5
MOV r6 r2
CMP r1 #1
JC #1 #1
JC #6 #3
MOV r0 #0
SUB r7 r6 r5
OUT r3
OUT r4
OUT r7
BRK
MOV r0 #0
MOV r0 #0
MOV r0 #0MOV r1 #1
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
