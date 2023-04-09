# Program: PrimeCheck
# Author: Mitchell Simmons
# Date: 4/9/23
# Purpose: Program to check if a number is prime

.global main

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
        LDR r6, =num
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
        MOV r7, #2 #Starting divisor
        MOV r8, #1 #Input is prime until we find a divisor

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
               LDR r0, =isPrime
               BL printf
               B StartLoop

           isNotPrime:
               #Print result and go back to initial loop
               LDR r0, =isNotPrime
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
    format: "%d"
    numInput: .word 0
    exit: .asciz "\nExiting Program."
    isPrime: .asciz "\n%d is prime."
    isNotPrime: .asciz "\n%d is not prime."
