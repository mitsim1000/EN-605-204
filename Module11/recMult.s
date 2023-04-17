# Program: recMult.s
# Author: Mitchell Simmons
# Date: 04/16/23
# Purpose: Function that recursefly multiplies

.global main

.text
main:
    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt for first int
    LDR r0, =prompt1
    BL printf
    LDR r0, =format
    LDR r1, =int1
    BL scanf

    #Prompt for second int
    LDR r0, =prompt2
    BL printf
    LDR r0, =format
    LDR r1, =int2
    BL scanf

    #Load int1 and int2 into r0 and r1 and call recMult function
    LDR r0, =int1
    LDR r1, =int2
    LDR r0, [r0, #0]
    LDR r1, [r1, #0]
    BL recMult

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "\nThis program multiplies 2 numbers together. Enter the first number: "
    prompt2: .asciz "\nEnter the second number: "
    format: .asciz "%d"
    int1: .word 0
    int2: .word 0
    output: .asciz "\nThe product is: %d"

.text
recMult:
#Function that recursively multiplies

    #Push stack
    SUB sp, sp, #12
