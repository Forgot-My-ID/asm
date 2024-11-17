ORG 100h

section data use16
    num1 dw 1234h   ; First 16-bit number (hexadecimal)
    num2 dw 5678h   ; Second 16-bit number (hexadecimal)
    result dw 0     ; Variable to store the result
    result_string db 6 dup(0)  ; Buffer to store the result message (assuming a 5-digit result and '$' terminator)
endsection

section code use16
    mov ax, [num1]  ; Load the first number into AX
    add ax, [num2]  ; Add the second number to AX
    mov [result], ax  ; Store the result

    ; Convert the result to ASCII for display
    mov cx, 5       ; Number of digits to display (assuming 5-digit numbers)
    mov si, result_string + 4  ; Start from the end of the buffer

convert_loop:
    mov dx, 10      ; Divisor for converting to ASCII
    div dx          ; Divide AX by 10, result in AX, remainder in DX
    add dl, '0'     ; Convert remainder to ASCII
    dec si          ; Move to the next position in the buffer
    mov [si], dl    ; Store the ASCII character

    loop convert_loop  ; Repeat until all digits are processed

    ; Display the result using emu8086's specific output function
    mov dx, offset result_string
    mov ah, 9       ; AH=9 is the "print string" function
    int 21h         ; Call the emu8086 interrupt

    int 20h         ; Terminate the program
endsection
