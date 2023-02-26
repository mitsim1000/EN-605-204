.text
.global main
main:
    SUB sp, sp, #4 //Push stack
    STR lr, [sp]

    LDR r0, =prompt1
    BL printf //Display prompt
    LDR r0, =formatString //Load format
    LDR r1, =totalFeet //Load address of totalFeet
    BL scanf //Read user input for feet
    LDR r4, =totalFeet
    LDR r4, [r4] //Load value of totalFeet into r4

    LDR r0, =prompt2
    BL printf //Display prompt for inches
    LDR r0, =formatString //Load format
    LDR r1, =totalInches //Load address of totalInches
    BL scanf //Read user input for inches
    LDR r3, =totalInches
    LDR r3, [r3] //Load value of totalInches into r3

    MOV r0, r4 //Total feet in r0
    MOV r1, #12 //12 inches in a foot
    MUL r0, r0, r1 //Convert total feet into inches
    ADD r0, r0, r3 //Add inches input

    MOV r1, r0 //Converted amount in r1
    LDR r0, =output
    BL printf

    LDR lr, [sp] //POP stack
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1: .asciz "Enter number of feet: "
    prompt2: .asciz "Enter number of inches: "
    totalFeet: .word 0
    totalInches: .word 0
    formatString: .asciz "%d"
    output: .asciz "\n%d inches\n"
