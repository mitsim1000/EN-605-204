# Program: fib.s
# Author: Mitchell Simmons
# Date 04/16/2023
# Purpose: Program that calculates Fibonacci numbers recursively

.global main

.text
main:
    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt user for n
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =int
    BL scanf

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter a positive integer n to calculate the n'th Fibonacci number: "
    format: .asciz "%d"
    int: .word 0
    output: .asciz "Corresponding Fibonacci number: %d"


