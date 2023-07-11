.MODEL SMALL
.STACK 100H
.DATA
A DB 0AH,0DH,"Positive $"
B DB 0AH,0DH,"Negative $"

.CODE
MAIN PROC
   MOV AX,@DATA
   MOV DS,AX 
   

   
   MOV AH,1   
   INT 21H
   MOV BH,AL
   
   CMP BH,30h
   JL NEGATIVE
   JG POSITIVE 
   JE EXIT
   
   POSITIVE:
   MOV AH,9
   LEA DX,A
   INT 21H 
   JMP EXIT
   
   NEGATIVE:
   MOV AH,9
   LEA DX,B
   INT 21H 
   JMP EXIT
   
   
   EXIT:
   MOV AH,4CH
   INT 21H
   
   MAIN ENDP
END MAIN
   
   
   
   