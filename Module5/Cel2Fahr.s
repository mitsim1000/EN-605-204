.text
.global main
main:
    //Push stack
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt //Load prompt
    BL printf //Print prompt
    LDR r0, =formatString //Load formatString
    LDR r1, =celcius //Load celcius
    BL scanf //Scan user input

    LDR r0, =celcius //Load user input into r0
    LDR r0, [r0] //Load value
    MOV r1, #9 
    MUL r0, r0, r1 //Multiply by 9 
    MOV r1, #5
    BL __aeabi_idiv //Divide by 5
    MOV r1, #32
    ADD r0, r0, r1 //Add 32

    //Print results
    MOV r1, r0
    LDR r0, =output
    BL printf

    //Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc,lr

.data
    output: .asciz "\nFahrenheit Temperature: %d\n"
    prompt: .asciz "\nEnter Celcius Temperature: "
    celcius: .word 0
    formatString: .asciz "%d"
