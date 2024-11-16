; 7(b) - Ytha Yu
; Read an uppercase letter (omit error checking), and display it at the next position on the same Une in lower case.
.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC        
    ;READ AN UPPERCASE CHARACTER (omit error checking)
    MOV AH, 1           ;read single character function (the input character is stored in AL)
    INT 21H
    
    ; CONVERT TO LOWERCASE 
    ADD AL, 20h
    
    ;DISPLAY CHARACTER                              
    MOV DL, AL          ;character is stored in AL  
    
    MOV AH, 2           ;display character function
    INT 21H             ;display the character stored in DL (the character is also stored in AL) 
    
    ;RETURN TO DOS
    MOV AH, 4CH         ;DOS exit function
    INT 21H             ;exit to DOS
    
MAIN ENDP                                           

END MAIN