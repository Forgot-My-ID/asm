.Model small
.stack 100h

.data
b dw 08h
c dw 02h

.code
MAIN PROC
mov ax,@data
mov ds,ax

mov bx,b
mov cx,c

sub bx,cx
add bx,30h

mov ah,02
mov dx,bx
int 21h

main endp
end main