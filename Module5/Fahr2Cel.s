.text
.global main
main:
    //Push stack
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt //Load prompt
    BL printf //Print prompt
    LDR r0, =formatString //Load format string
    LDR r1, =fahr //Load integer
    BL scanf

    LDR r0, =fahr
    LDR r0, [r0] //Load fahr input value
    MOV r1, #32
    SUB r0, r0, r1 //Subtract 32
    MOV r1, #5
    MUL r0, r0, r1 //Multiply by 5
    MOV r1, #9
    BL __aeabi_idiv //Divide by 9
    
    //Print output
    MOV r1, r0
    LDR r0, =output
    BL printf

    //Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc,lr

.data
    output: .asciz "\nCelcius Temperature: %d\n"
    prompt: .asciz "\nEnter Fahrenheit Temperature: "
    fahr: .word 0
    formatString: .asciz "%d"
