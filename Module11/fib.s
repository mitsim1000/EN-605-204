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

    #Move input to r0 and call Fib
    LDR r0, =int
    LDR r0, [r0, #0]
    BL Fib

    #Display result
    MOV r1, r0
    LDR r0, =output
    BL printf 

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "\nEnter a positive integer n to calculate the n'th Fibonacci number: "
    format: .asciz "%d"
    int: .word 0
    output: .asciz "\nCorresponding Fibonacci number: %d\n"

.text
Fib:

    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Move input to r4
    MOV r4, r0

    #Base case n = 0, return 0
    CMP r4, #0
    MOVEQ r0, #1
    BEQ end

    #Base case n = 1, return 1
    CMP r4, #1
    BNE else
      MOV r0, #1
      B end

    #Else return Fib(n-1) + Fib(n-2)
    else:
        SUB r0, r4, #1
        BL Fib
        MOV r3, r0
        SUB r0, r3, #2
        BL Fib
        ADD r0, r0, r3
        B end

    end:
      #Pop stack
      LDR lr, [sp, #0]
      ADD sp, sp, #4
      MOV pc, lr

.data
