# Program: ListPrimes
# Author: Mitchell Simmons
# Date: 4/9/23
# Purpose: Program to list prime numbers

.global main
.global findRemainder

.text
main:
    #Dictionary:
    # r4 - prime loop counter
    # r5 - prime loop limit
    # r6 - Number to test for primeness
    # r7 - divisor
    # r8 - boolean if number is prime. 1 if yes, 0 if no
    # r9 - Initial loop limit

    #Push Stack
    SUB sp, sp, #28
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]
    STR r8, [sp, #20]
    STR r9, [sp, #24]
    
    #Prompt user for number and store it in r9
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =numInput
    BL scanf
    LDR r9, =numInput
    LDR r9, [r9, #0]

    #If user enters less than 2, print invalid input error
    CMP r9, #2
    BLE InputError

    #Initialize
    MOV r6, #2
    
    StartLoop:
        #Increment r6
        ADD r6, r6, #1

        #Check the limit    
        CMP r6, r9 
        BGE EndLoop

        #Loop statement
        B primeCheck

        

    primeCheck:
        #Get n/2 - 2
        MOV r0, r6
        MOV r1, #2
        BL __aeabi_idiv
        SUB r0, r0, #2

        #Initialize rest of the variables
        MOV r4, #0
        MOV r5, r0
        MOV r7, #2 
        MOV r8, #1 

        #Start prime checking loop
        primeCheckLoop:
            #Check the limit
            CMP r4, r5
            BGE endPrimeCheckLoop

            #Loop Statement (Check if input can be divided by current divisor (r7))
            MOV r0, r6
            MOV r1, r7
            BL findRemainder
            CMP r0, #0
            MOVEQ r8, #0
            BEQ endPrimeCheckLoop

            #Get the next value
            ADD r4, r4, #1
            ADD r7, r7, #1
            B primeCheckLoop

       endPrimeCheckLoop:
            #Move r6 (user input) into r1, and print result
            MOV r1, r6
            CMP r8, #1
            BEQ isPrime
                B isNotPrime
           
           isNotPrime:
               #Go back to initial loop
               B StartLoop

           isPrime:
               #Print result and go back to initial loop
               LDR r0, =isPrimeOutput
               BL printf
               B StartLoop

    InputError:
        LDR r0, =invalidError
        BL printf

    EndLoop:
        LDR r0, =exit
        BL printf    

    #Pop Stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    LDR r7, [sp, #16]
    LDR r8, [sp, #20]
    LDR r9, [sp, #24]
    ADD sp, sp, #28
    MOV pc, lr
 
.data
    prompt: .asciz "\nEnter the maximum integer to test for primeness: \n"
    invalidError: .asciz "\nYou must enter a number greater than 3.\n"
    format: .asciz "%d"
    numInput: .word 0
    exit: .asciz "\nExiting Program."
    isPrimeOutput: .asciz "\n%d is prime."

.text
findRemainder:
#Function that returns the remainder of r0/r1
    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Store dividend in r2 and divisor in r3
    LDR r2, =dividend
    LDR r3, =divisor
    STR r0, [r2, #0]
    STR r1, [r3, #0]
     
    #Find quotient
    BL __aeabi_idiv
    LDR r1, =quotient
    STR r0, [r1, #0]

    #Find remainder
    LDR r0, =dividend
    LDR r1, =divisor
    LDR r2, =quotient
    LDR r0, [r0, #0]
    LDR r1, [r1, #0]
    LDR r2, [r2, #0]
    MUL r1, r1, r2
    SUB r0, r0 ,r1
    
    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    dividend: .word 0
    divisor: .word 0
    quotient: .word 0
