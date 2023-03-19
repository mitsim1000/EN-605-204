# Name: TestInchesToFt.s
# Author: Mitchell Simmons
# Date: 03/18/23
# Purpose: Test the InchesToFt  Library Function

.text
.global main
main:

    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt for an input in inches
    ldr r0, =prompt1
    bl printf

    #Scan input
    ldr r0, =input1
    sub sp, sp, #4
    mov r1, sp
    BL scanf
    ldr r0, [sp, #0]
    add sp, sp, #4
    
    #Convert
    bl InchesToFt
    mov r2, r1
    mov r1, r0
  
    #Print Feet and inches
    ldr r0, =format1
    bl printf

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the number of inches: \n"
    format1: .asciz "\nThat is equal to %d feet and %d inches\n"
    input1: .asciz "%d"
