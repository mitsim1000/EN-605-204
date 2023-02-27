.text
.global main
main:
    //Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]
    
    LDR r0, =prompt //Load prompt
    BL printf //Print prompt
    LDR r0, =format //Load format
    LDR r1, =input //Load input integer
    BL scanf //Scan user input
    LDR r4, =input
    LDR r4, [r4, #0] //Load value into r1

    MVN r0, r4 //One's complement on input integer
    ADD r1, r0, #1 //Add one to complete two's complement
    LDR r0, =output //Load output
    BL printf

    //Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    output: .asciz "\nNegative value: %d\n"
    prompt: .asciz "Enter an integer: "
    format: .asciz "%d"
    input: .word 0 
