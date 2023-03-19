# Name: TestKPH.s
# Author: Mitchell Simmons
# Date: 03/18/23
# Purpose: Test the kph library function

.text
.global main
main:

    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt for an input in miles
    ldr r0, =prompt1
    bl printf

    #Scan miles input and store in r4
    ldr r0, =input1
    sub sp, sp, #4
    mov r1, sp
    BL scanf
    ldr r0, [sp, #0]
    add sp, sp, #4
    mov r4, r0

    #Prompt for an input in Hours 
    ldr r0, =prompt2
    bl printf

    #Scan hours input and store in r3
    ldr r0, =input1
    sub sp, sp, #4
    mov r1, sp
    BL scanf
    ldr r0, [sp, #0]
    add sp, sp, #4
    mov r3, r0
    
    #Convert. Hours needs to be in r1 and miles in r0
    MOV r1, r3
    MOV r0, r4
    bl kph
    mov r1, r0
  
    #Print F
    ldr r0, =format1
    bl printf

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter the number of miles: \n"
    prompt2: .asciz "Enter the number of hours: \n" 
    format1: .asciz "\nKPH: %d\n"
    input1: .asciz "%d"
    num1: .word 0    

#END main

