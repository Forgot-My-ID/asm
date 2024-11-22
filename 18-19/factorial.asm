ORG 100h  ; Standard 8086 program start address

MOV CX, 4  ; Set the number for which you want to find the factorial.
MOV AX, 1  ; Initialize AX with 1.
MOV BX, CX ; Copy the number to BX for iteration

LOOP_START:
    MUL BX  ; Multiply AX by BX
    DEC BX  ; Decrement BX
    JNZ LOOP_START ; Jump back to LOOP_START if BX is not zero

; Convert the result in AX to a printable format (ASCII characters)
PUSH AX ; Save AX on the stack
MOV CX, 10 ; Set CX to 10 for decimal conversion
MOV BX, 0  ; Initialize BX to store the reversed result

CONVERT_LOOP:
    XOR DX, DX       ; Clear DX for division
    DIV CX           ; Divide AX by 10, quotient in AX, remainder in DX
    ADD DL, '0'      ; Convert the remainder to ASCII
    PUSH DX          ; Push the digit on the stack
    CMP AX, 0        ; Check if quotient is zero
    JNZ CONVERT_LOOP ; If not, continue the loop

DISPLAY_LOOP:
    POP DX        ; Pop a digit from the stack
    MOV AH, 02h   ; DOS function to display a character
    INT 21h       ; DOS interrupt to display the character
    CMP SP, BP    ; Check if the stack is empty (SP == BP)
    JNZ DISPLAY_LOOP ; If not, continue displaying digits

MOV AH, 4Ch  ; DOS function to terminate the program
INT 21h      ; DOS interrupt to terminate the program

RET
