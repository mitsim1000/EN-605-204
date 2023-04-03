#Program: notLogicalCharCheck.s
#Author: Mitchell Simmons
#Date: 04/03/2023
#Purpose: Check if input is a character

.global main
.global isChar

.text
main:
  
    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]
  
    #Test case 1: #0x40
    MOV r1, #0x40
    MOV r7, r1
    BL isChar
    MOV r8, r0
    LDR r0, =output
    MOV r1, r7
    MOV r2, r8
    BL printf

    #Print if character
    CMP r8, #0
    BEQ elseIf1

elseIf1:
    #Test case 2: #0x5b
    MOV r1, #0x5b
    MOV r7, r1
    BL isChar
    MOV r8, r0
    LDR r0, =output
    MOV r1, r7
    MOV r2, r8
    BL printf
  
    #Print if character
    CMP r8, #0
    BEQ elseIf2

elseIf2:  
    #Test case 3: #0x71
    MOV r1, #0x71
    MOV r7, r1
    BL isChar
    MOV r8, r0
    LDR r0, =output
    MOV r1, r7
    MOV r2, r8
    BL printf
  
    #Print if character
    CMP r8, #0
    BEQ elseIf3
    
elseIf3:
    #Test case 4: #0x7a
    MOV r1, #0x7a
    MOV r7, r1
    BL isChar
    MOV r8, r0
    LDR r0, =output
    MOV r1, r7
    MOV r2, r8
    BL printf
  
    #Print if character
    CMP r8, #0
    BEQ end

end:
  
    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
  
.data
  output: .asciz "\nAscii Value: %d Is Character? (1 if true; 0 if False): %d"
#end main


.text
#Check if input is a character
isChar:

#Check if input is a character
isChar:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]
  
    #Store 1 in r0 for bit masking
    MOV r0, #1
   
    #Check if r1 is greater than 0x41
    SUB r2, r1, #0x41    
    ROR r2, #31          
    MVN r2, r2   	
    AND r2, r2, r0       
    
    #Check if r1 is less than 0x5a
    SUB r3, r1, #0x5a    
    ROR r3, #31          
    AND r3, r3, r0    

    #Check if both of the above 2 blocks are true	
    AND r2, r2, r3       
   
    #Check if r1 greater than 0x61
    SUB r4, r1, #0x61    
    ROR r4, #31          
    MVN r4, r4           
    AND r4, r4, r0       
    
    #Check if r1 less than 0x7a)
    SUB r3, r1, #0x7a    
    ROR r3, #31          
    AND r3, r3, r0
    
    #Check if both of the above 2 blocks are true	
    AND r3, r4, r3       
      
    #Check if either of the above 2 AND statements is true
    ORR r0, r2, r3
  
    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
.data
# end isChar


