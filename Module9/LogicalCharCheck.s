#Program: LogicalCheckChar.s
#Author: Mitchell Simmons
#Date: 04/02/23
#Purpose: Logically check if input is a character

.global main
.global isChar

.text
main:
  
    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]
  
    #Test case 1: #0x40
    MOV r1, #0x40
    MOV r4, r1
    BL isChar
    MOV r5, r0
    LDR r0, =output
    MOV r1, r4
    MOV r2, r5
    BL printf

    #Print if character
    CMP r5, #0
    BEQ elseIf1

elseIf1:
    #Test case 2: #0x5b
    MOV r1, #0x5b
    MOV r4, r1
    BL isChar
    MOV r5, r0
    LDR r0, =output
    MOV r1, r4
    MOV r2, r5
    BL printf
  
    #Print if character
    CMP r5, #0
    BEQ elseIf2

elseIf2:  
    #Test case 3: #0x71
    MOV r1, #0x71
    MOV r4, r1
    BL isChar
    MOV r5, r0
    LDR r0, =output
    MOV r1, r4
    MOV r2, r5
    BL printf
  
    #Print if character
    CMP r5, #0
    BEQ elseIf3
    
elseIf3:
    #Test case 4: #0x7a
    MOV r1, #0x7a
    MOV r4, r1
    BL isChar
    MOV r5, r0
    LDR r0, =output
    MOV r1, r4
    MOV r2, r5
    BL printf
  
    #Print if character
    CMP r5, #0
    BEQ end

end:
  
    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
  
.data
  output: .asciz "\n1. Ascii Value: %d;  2. Character? (1 if true; 0 if False): %d"
#end main


.text
#Check if input is a character
isChar:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]
  
    #Check if r1 greater than 0x41
    MOV r2, #0         
    CMP r1, #0x41
    ADDGE r2, #1       
  
    #Check if r1 less than 0x5a and greater than 0x41
    MOV r3, #0         
    CMP r1, #0x5a
    ADDLT r3, #1       
    AND r2, r2, r3     
  
    #Check if r1 greater than 0x61
    MOV r0, #0         
    CMP r1, #0x61   
    ADDGE r0, #1       
  
    #Check if r1 less than 0x7a and greater than 0x61
    MOV r3, #0         
    CMP r1, #0x7a
    ADDLT r3, #1       
    AND r3, r3, r0     
    
    #Check if either of the 2 And statements are true
    ORR r0, r2, r3
  
    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
# end isChar


