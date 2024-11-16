; Write a progratn to read one of the hex digits A—Y, and display it on the next line in decimal.
; Sample execution:
; ENTER A HEX C
; IN DECIMAL IT 12

; YTHA YU - CHAPTER 4 EXERCISE 10
.MODEL SMALL 

.DATA
PROMPT DB 'ENTER A HEX DIGIT: $'
MSG DB 0AH, 0DH, 'IN DECIMAL IT IS 1' 
INPUT DB ?,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;DISPLAY PROMPT   
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    ;READ THE HEX DIGIT
    MOV AH, 1
    INT 21H
         
    ;CONVERT TO DECIMAL
    SUB AL, 11H
         
    ;STORE IN MEMORY
    MOV INPUT, AL
               
    ;DISPLAY MESSAGE            
    LEA DX, MSG
    MOV AH, 9
    INT 21H
   
    ;RETURN TO DOS
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
