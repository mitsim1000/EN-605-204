.text
.global main
main:
    SUB sp, sp, #4 //Push stack
    STR lr, [sp]
    
    LDR r0, =prompt
    BL printf //Display prompt
    LDR r0, =formatString //Load format
    LDR r1, =totalInches //Load address of totalInches
    BL scanf //Read user input for inches

    LDR r0, =totalInches //Load address of totalInches into r0
    LDR r0, [r0] //Load value
    MOV r1, #12 //12 inches in a foot
    BL __aeabi_idiv //Divide inches by 12
    MOV r4, r0 //Feet in r4
    
    MOV r1, #12
    MOV r0, r4 //Load total amount of feet into r0
    MUL r0, r1, r4 //Convert feet to inches
    
    LDR r1, =totalInches //Load address of total inches
    LDR r1, [r1] //Load value
    SUB r1, r1, r0 //Remaining inches stored in r1

    MOV r2, r1 //Load inches into r2
    MOV r1, r4 //Load hours into r0
    LDR r0, =output
    BL printf       

    LDR lr, [sp] //POP stack
    ADD sp, sp, #4
    MOV pc, lr

.data
    formatString: .asciz "%d"
    output: .asciz "\n%d Feet and %d inches\n"
    prompt: .asciz "Enter total inches: "
    totalInches: .word 0
