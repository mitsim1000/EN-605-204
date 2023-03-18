.global miles2kilometers
.global kph

.text
#Function to convert miles (in r0) to kilometers (in r0)
miles2kilometers:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Convert miles to kilometers
    MOV r1, #16
    MUL r0, r0, r1
    MOV r1, #10
    BL __aebi_idiv

    #Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
#END miles2kilometers

.text
#Function to convert miles (in r1) and hours (in r0) to kph which is returned in r0
kpd:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Convert miles into kilometers (in r0)
    MOV r0, r1
    BL miles2kilometers

    #Convert kilometers (in r0) and hours into kph
    LDR r1, =Hours
    LDR r1, [r1, #0]
    BL __aebi_idiv

.data
    hours: .word 0
