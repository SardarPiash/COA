.MODEL SMALL
.STACK 100H
.DATA
A DB 0AH,0DH,"WRONG INPUT! ALPHABATES ONLY.. $"
B DB 0AH,0DH,"VALID INPUT $" 
C DB 0AH,0DH, "CORRECT ORDER IS: $"
D DB 0AH,0DH,"INPUT $"

.CODE
MAIN PROC
   MOV AX,@DATA
   MOV DS,AX 
   
   MOV CL,2
   
   CHECKAGAIN:
   MOV AH,9
   LEA DX,D
   INT 21H
   
   VALIDCHECK:
   ;MOV CH,BH
   MOV AH,1   
   INT 21H
   MOV BH,AL
   
   
   

   
   CHECK:
   CMP BH,41h
   JB NOTVALID
   CMP BH,5Ah
   JA NOTVALID
   JMP VALID

   
   
   NOTVALID:
   MOV AH,9
   LEA DX,A
   INT 21H
   MOV CL,2 
   JMP CHECKAGAIN
   
   VALID:
   ;MOV CH,BH
   CMP CL,0 
   DEC CL
   JG VALIDCHECK1
   CMP BH,CH
   JB OUTPUT1
   JA OUTPUT2
   
   VALIDCHECK1:
   MOV CH,BH
   JMP VALIDCHECK
   
   OUTPUT1:
   MOV AH,9
   LEA DX,C
   INT 21H
   MOV AH,2
   MOV DL,BH
   INT 21H
   MOV DL,CH
   INT 21H
   JMP EXIT
   
   OUTPUT2:
   MOV AH,9
   LEA DX,C
   INT 21H
   MOV AH,2
   MOV DL,CH
   INT 21H
   MOV DL,BH
   INT 21H
   JMP EXIT 
   
   
   EXIT:
   MOV AH,4CH
   INT 21H
   
   MAIN ENDP
END MAIN
   
   
   
   