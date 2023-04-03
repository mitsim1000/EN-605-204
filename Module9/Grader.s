#Program: Grader.s
#Author: Mitchell Simmons
#Date: 04/02/2023
#Purpose: Calculate a student's grade

.global main
.global printGrades


.text
main:

    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Prompt for name
    LDR r0, =namePrompt
    BL printf
    
    #Scan input
    LDR r0, =nameFormat
    LDR r1, =name1
    BL scanf   

    #Prompt for grade
    LDR r0, =gradePrompt
    BL printf

    #Scan input
    LDR r0, =gradeFormat
    LDR r1, =grade1
    BL scanf

    #Print Grade
    LDR r0, =grade1
    LDR r1, =name1
    LDR r0, [r0, #0]
    BL printGrades

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    namePrompt: .asciz "Enter student's  name: "
    nameFormat: .asciz "%s"
    gradePrompt: .asciz "Enter student's grade: "
    gradeFormat: .asciz "%d"
    name1: .space 40
    grade1: .word 0
    test: .asciz "TEST"
#End main

.text
#Print output
printGrades:
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]
    
    #Move grade to r3 and name to r4
    MOV r4, r1
    MOV r3, r0

    #Check if outside 0-100
    MOV r0, #0
    CMP r3, #0
    ADDGE r0, r0, #1
    MOV r1, #0
    CMP r3, #100
    ADDLE r1, r1, #1
    CMP r1, #1
    BNE ErrorMsg
        B validGrade

#Invalid grade; print error message
ErrorMsg:
    LDR r0, =error
    BL printf
    B end
#Check if grade is less than 70
validGrade:
    CMP r3, #70
    BGE elseC
        MOV r1, r4
        MOV r2, r3
        LDR r0, =gradeF
        BL printf
        B end
#Check if grade less than 80
elseC:
    CMP r3, #80
    BGE elseB
        MOV r1, r4
        MOV r2, r3
        LDR r0, =gradeC
        BL printf
        B end
#Check if grade less than 90
elseB:
    CMP r3, #90
    BGE elseA
         MOV r1, r4
         MOV r2, r3
         LDR r0, =gradeB
         BL printf
         B end
#Grade is A
elseA:
    MOV r1, r4
    MOV r2, r3
    LDR r0, =gradeA
    BL printf
end:

    #Pop stack
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8

.data
    error: .asciz "\nGrade must be 0-100. \n"
    gradeF: .asciz "Student: %s Grade: F Average: %d\n"
    gradeC: .asciz "Student: %s Grade: C Average: %d\n"
    gradeB: .asciz "Student: %s Grade: B Average: %d\n"
    gradeA: .asciz "Student: %s Grade: A Average: %d\n"

 
