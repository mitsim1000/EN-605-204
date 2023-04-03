#Program: Grader.s
#Author: Mitchell Simmons
#Date: 04/02/2023
#Purpose: Calculate a student's grade

.global main
.global ErrorCheck
.global PrintGrades

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

    #Error checking
    LDR r0, =grade1
    LDR r0, [r0, #0]
    BL ErrorCheck

    #If no error, print grades
   # CMP r2, #1
   # BNE endMain
    #    LDR r0, =name1
     #   LDR r1, =grade1
      #  LDR r1, [r1, #0]
       # BL PrintGrades
    
endMain:

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
#End main

.text
#ErrorCheck assuming grade is in r0
ErrorCheck:
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]

    MOV r3, r0
    MOV r0, #0
    CMP r3, #0
    ADDGE r0, r0, #1
    MOV r1, #0
    CMP r3, #100
    ADDLE r1, r1, #1
    
    CMP r1, #1
    BNE ErrorMsg
        B endError

ErrorMsg:
    LDR r0, =error
    BL printf

endError:

    #Pop stack
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8

.data
    error: .asciz "\nGrade must be 0-100"

.text
PrintGrades:
   
    #Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Move name to r8 and grade to r7
    MOV r8, r0
    MOV r7, r1

    CMP r7, #70
    BGE elseIfNotF
        MOV r1, r8
        MOV r2, r7
        LDR r0, =gradeF
        BL printf
        B endPrint

    elseIfNotF:
         MOV r1, r8
         MOV r2, r7
         LDR r0, =gradeA
         BL printf
         
    endPrint:

    #Pop Stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
     gradeF: .asciz "Student: %s Grade: F Average: %d\n"
     gradeA: .asciz "Student: %s Grade: A Average: %d\n"
