# Program Name: libConversions.s
# Author: Mitchell Simmons
# Date: 03/18/2023
# Purpose: Library of conversion functions


.global miles2kilometers
.global kph
.global CToF
.global InchesToFt


.text
#Function to convert miles (in r0) to kilometers (in r0)
miles2kilometers:
    
    #One mile is approximately equal to 1.6 kilometers.
    #In this program, we are working with integers so we must multiply by 16 and divide by 10.
    #We multiply by first and then divide to get a more accurate result since we are dividing
    #a larger number rather than a smaller number. 

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Convert miles to kilometers
    MOV r1, #16
    MUL r0, r0, r1
    MOV r1, #10
    BL __aeabi_idiv

    #Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
#END miles2kilometers


.text
#Function to convert miles (in r1) and hours (in r0) to kph which is returned in r0
kph:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Convert miles into kilometers (in r0)
    MOV r0, r1
    BL miles2kilometers

    #Convert kilometers (in r0) and hours into kph
    LDR r1, =hours
    LDR r1, [r1, #0]
    BL __aeabi_idiv

.data
    hours: .word 0
#END kph


.text
#Function to convert Celcius to Fahrenheit
CToF:
    # r0 = (r0 * 9)/5 + 32
    
    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r1, #9
    MUL r0, r0, r1
    MOV r1, #5
    BL __aeabi_idiv
    ADD r0, r0, #32

    #Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
#END CToF


.text
#Function to convert inches (in r0) to feet (in r0)
InchesToFt:

    #Push Stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Divide number of feet by 12 (in r0)
    MOV r1, #12
    BL __aeabi_idiv 

    #Calculate the remaining inches (in r1)
    MOV r1, #12
    MUL r4, r0, r1
    SUB r1, r4, r1

    #Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
#END InchesToFt 
