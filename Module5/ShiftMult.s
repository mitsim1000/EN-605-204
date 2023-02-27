.text
.global main
main:
    //Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    LDR r0, =prompt //Load prompt
    BL printf //Display prompt

    LDR r0, =format //Load format
    LDR r1, =input //Load input
    BL scanf //Scan input
    LDR r4, =input //Store input integer in r4
    LDR r4, [r4, #0]

    LSL r5, r4, #3 //store 8 bit integer in r5
    LSL r6, r4, #1 //store 2 bit integer in r6
    ADD r7, r5, r6

    MOV r1, r4
    MOV r2, r7
    LDR r0, =output
    BL printf //print output

    //Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter an integer: "
    output: .asciz "\n%d * 10 = %d\n"
    format: .asciz "%d"
    input: .word 0
