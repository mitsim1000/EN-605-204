# Program: PrimeCheck
# Author: Mitchell Simmons
# Date: 4/9/23
# Purpose: Program to check if a number is prime

.global main
.global findRemainder

.text
main:
    #Dictionary:
    # r4 - prime loop counter
    # r5 - prime loop limit
    # r6 - user input number for test
    # r7 - divisor
    # r8 - boolean if number is prime. 1 if yes, 0 if no

    #Push Stack
    SUB sp, sp, #24
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]
    STR r8, [sp, #20]

    StartLoop:
        #Prompt user for number and store it in r6
        LDR r0, =prompt
        BL printf
        LDR r0, =format
        LDR r1, =numInput
        BL scanf
        LDR r6, =numInput
        LDR r6, [r6, #0]

        #If user enters -1, exit
        CMP r6, #-1
        BEQ EndLoop

        #If user enters less than 2, print invalid input error
        CMP r6, #2
        BLE InputError
            B primeCheck

    primeCheck:
        #Get n/2
        MOV r0, r6
        MOV r1, #2
        BL __aeabi_idiv
       
        #Set r5 to n/2 - 2
        SUB r5, r0, #2

        #Initialize rest of the variables
        MOV r4, #0
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
           
           isPrime:
               #Print result and go back to initial loop
               LDR r0, =isPrimeOutput
               BL printf
               B StartLoop

           isNotPrime:
               #Print result and go back to initial loop
               LDR r0, =isNotPrimeOutput
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
    ADD sp, sp, #24
    MOV pc, lr
 
.data
    prompt: .asciz "\nEnter an integer: \n"
    invalidError: .asciz "\nYou must enter a number greater than 3.\n"
    format: .asciz "%d"
    numInput: .word 0
    exit: .asciz "\nExiting Program."
    isPrimeOutput: .asciz "\n%d is prime."
    isNotPrimeOutput: .asciz "\n%d is not prime."

.text
findRemainder:
#Function that returns the remainder of r0/r1
    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Store dividend in r4 and divisor in r3
    LDR r4, =dividend
    LDR r3, =divisor
    STR r0, [r4, #0]
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
