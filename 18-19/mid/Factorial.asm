MOV CX,05	
MOV AX,01	
MOV DX,0000 

L1:	
MUL CX
LOOP L1  
     
;store
MOV CX, AX
;print
MOV AH , 2
MOV DL, CH
INT 21H  
MOV AH , 2
MOV DL, CL
INT 21H
	
HLT   

