#Program: LargestInt.s
#Author: Mitchell Simmons
#Date: 04/02/2023
#Purpose: Find the maximum of 3 integers

.global main
.global prompt
.global maxInt

.text
main:
    
    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt for Ints
    BL prompt
    MOV r5, r0
    BL prompt
    MOV r6, r0
    BL prompt
    MOV r7, r0

    #Find max integer
    MOV r0, r7
    MOV r1, r6
    MOV r2, r5 
    BL maxInt

    #Print results
    MOV r1, r0
    LDR r0, =output
    BL printf

    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\n Maximum integer is: %d\n"

.text
#Finds the ma0ximum of 3 integers
maxInt:

    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Compare first two ints
    CMP r0, r1
    BLE CompareInt2
      MOV r1, r0
      B CompareInt2
  
#Compare 3rd int to maximum of first two ints
CompareInt2:
    CMP r1, r2
    BLE end
        MOV r2, r1
        B end

#Move result to r0
end:
    MOV r0, r2
 
    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
.data

.text
#Prompts user for integer and stores value in r0
prompt:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Display prompt
    LDR r0, =prompt1
    BL printf

    #Read prompt
    LDR r0, =format
    LDR r1, =integer
    BL scanf

    #Store result in r0
    LDR r0, =integer
    LDR r0, [r0, #0]

    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter an integer: "
    format: .asciz "%d" 
    integer: .word 0
