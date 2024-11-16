; Write a program to (a) display "?"
; (b) read three initials, 
; (C) display them in the middle of an 11 x II box of asterisks, and
; (d) beep the computer.
; YTHA YU - CHAPTER 4 EXERCISE 12
.MODEL SMALL 

.DATA
STARS DB 0AH, 0DH, '***********$'
MIDDLE DB 0AH, 0DH, '****',?,?,?,'****$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;DISPLAY ?
    MOV DL, '?'
    MOV AH, 2
    INT 21H
    
    ;INPUT FIRST INITIAL
    MOV AH, 1
    INT 21H
    
    ;STORE IT
    MOV MIDDLE+6, AL
    
    ;INPUT SECOND INITIAL
    MOV AH, 1
    INT 21H
    
    ;STORE IT
    MOV MIDDLE+7, AL
    
    ;INPUT THIRD INITIAL
    MOV AH, 1
    INT 21H
    
    ;STORE IT
    MOV MIDDLE+8, AL
    
    ;PRINT THE TOP HALF OF THE BOX
    LEA DX, STARS
    MOV AH, 9
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H
             
    ;PRINT THE MIDDLE LINE
    LEA DX, MIDDLE
    MOV AH, 9
    INT 21H
        
    ;PRINT THE BOTTOM HALF OF THE BOX
    LEA DX, STARS
    MOV AH, 9
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H          
    
    ;BEEP SOUND
    MOV DL,07H
    MOV AH,2
    INT 21H
   
    ;RETURN TO DOS
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN