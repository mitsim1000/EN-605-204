# Program Name: TestCToF.s
# Author: Mitchell Simmons
# Date: 03/18/23
# Purpose: Test the CToF Library Function

.text
.global main
main:

    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt for an input in Celcius
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
    bl CToF
    mov r1, r0
  
    #Print F
    ldr r0, =format1
    bl printf

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the temp in C: \n"
    format1: .asciz "\nThe temp in F is: %d\n"
    input1: .asciz "%d"
    num1: .word 0    

#END main
