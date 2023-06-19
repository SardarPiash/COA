.MODEL SMALL
.STACK 100H
.DATA

A DB ?
B DB ?
.CODE
MAIN PROC
   MOV AX,@DATA
   MOV DS,AX 
   
   MOV AH,2
   MOV DL, 3Fh
   INT 21H
   
   MOV AH,1   
   INT 21H  
   MOV A,AL
   
   MOV AH,1
   INT 21H
   MOV B,AL 
   
   MOV BL,A 
   
   ADD BH,A
   ADD BH,B
   SUB BH,30H 
   
   MOV AH,2
   MOV DX,0AH
   INT 21H
   MOV DX,0DH
   INT 21H
   
   MOV AH,2
   MOV DL,BH
   INT 21H
         
   MAIN ENDP
END MAIN