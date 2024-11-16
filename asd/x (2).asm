; TAKES A SINGLE CHARACTER AS INPUT AND ECHOS IT
.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC        
    ;READ A CHARACTER
    MOV AH, 1           ;read single character function (the input character is stored in AL)
    INT 21H
    
    ;DISPLAY CHARACTER
    MOV AH, 2           ;display character function
    MOV DL, AL          ;character is stored in AL
    INT 21H             ;display the character stored in DL (the character is also stored in AL) 
    
    ;RETURN TO DOS
    MOV AH, 4CH         ;DOS exit function
    INT 21H             ;exit to DOS
    
MAIN ENDP                                           

END MAIN