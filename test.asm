; --- CHUNK 1: Initialization & Baseline Setup ---
MOV r1 #60      ; r1 = Target number to factorize (e.g., 60)
MOV r2 #2       ; r2 = Current trial divisor (starts at 2)
MOV r3 #0       ; r3 = Total count of prime factors found
MOV r4 #0       ; r4 = Running sum of prime factors
MOV r5 #0       ; r5 = Minimum prime factor found (0 means unset)
MOV r6 #0       ; r6 = Maximum prime factor found
MOV r0 #0       ; Padding instruction
MOV r0 #0       ; Padding instruction

; --- CHUNK 2: The Core Factorization Loop (Trial Division) ---
CMP r1 #1       ; Check if the remaining number is 1
JC #0 #7        ; If r1 == 1, factorization is complete -> jump to termination (Local 7)
DIV r7 r1 r2    ; r7 = r1 / r2
MUL r0 r7 r2    ; r0 = r7 * r2 (Reconstruct to check for remainder)
CMP r1 r0       ; Compare original r1 with reconstructed value
JC #0 #1        ; If Equal (#0), r2 is a factor -> jump to Factor Processing (Chunk 3 / Local 1)
ADD r2 r2 #1    ; If Not Equal, increment trial divisor r2 by 1
JC #6 #1        ; Unconditional jump back to start of Chunk 2 (Local 1)

; --- CHUNK 3: Factor Processing & Track Min/Max ---
MOV r1 r7       ; Update r1 with the divided quotient (r1 = r7)
OUT r2          ; Output the discovered prime factor!
ADD r3 r3 #1    ; Increment total factor count
ADD r4 r4 r2    ; Add factor to running sum
CMP r5 #0       ; Check if Min Factor (r5) has been set yet
JC #0 #7        ; If r5 == 0, this is our first factor -> jump to set Min (Local 7)
JC #6 #1        ; Otherwise, skip to Max check (Chunk 4 / Local 1)
MOV r5 r2       ; Set Min Factor = current factor r2
MOV r6 r2       ; Set Max Factor = current factor r2 (Initial default)

; --- CHUNK 4: Max Factor Evaluation & Loop Reset ---
CMP r2 r6       ; Compare current factor with historical Max Factor
JC #2 #4        ; If Greater Than (#2), jump to update Max (Local 4)
JC #6 #5        ; Otherwise, skip to loop re-entry point (Local 5)
MOV r6 r2       ; Update Max Factor with new highest value
CMP r1 #1       ; Check again if target has been reduced to 1
JC #1 #1        ; If Not Equal (#1), jump all the way back to Trial Division (Chunk 2 / Local 1)
JC #6 #3        ; Else, drop down to Final Statistics phase (Chunk 5 / Local 3)
MOV r0 #0       ; Padding instruction

; --- CHUNK 5: Calculate Range & Output Statistics ---
SUB r7 r6 r5    ; r7 = Range (Max Factor - Min Factor)
OUT r3          ; Output 1st Stat: Total number of factors found
OUT r4          ; Output 2nd Stat: Sum of all prime factors
OUT r7          ; Output 3rd Stat: Mathematical Range of the factors
BRK             ; Halt execution cleanly
MOV r0 #0       ; Padding instruction
MOV r0 #0       ; Padding instruction
MOV r0 #0       ; Padding instruction
