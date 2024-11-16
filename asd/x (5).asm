;Write a program to (a) prompt the user. (b) iead first, middle, and
;last initials of a person's natne, and (c) display them down the
;left margin.
;Sample execution:
;ENTER THREE INZTIAI.S: JFK
;J
;F
;K
; YTHA YU - CHAPTER 4 EXERCISE 9
.MODEL SMALL 

.DATA
MSG DB 'ENTER THREE INITIALS: $' 
INPUT DB 0AH, 0DH, ?, 0AH, 0DH,?, 0AH, 0DH,?,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;DISPLAY MESSAGE   
    LEA DX, MSG
    MOV AH, 9
    INT 21H
    
    ;READ THE FIRST INITIAL
    MOV AH, 1
    INT 21H
    
    ;STORE IN MEMORY
    MOV INPUT+2, AL
                   
    ;READ THE SECOND INITIAL
    MOV AH, 1
    INT 21H
    
    ;STORE IN MEMORY
    MOV INPUT+5, AL
    
    ;READ THE THIRD INITIAL
    MOV AH, 1
    INT 21H
    
    ;STORE IN MEMORY
    MOV INPUT+8, AL
               
    ;GET MESSAGE START ADDRESS            
    LEA DX, INPUT
    MOV AH, 9
    INT 21H
   
    ;RETURN TO DOS
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
