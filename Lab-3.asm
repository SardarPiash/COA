.MODEL SMALL
.STACK 100H
.DATA
A DB "Input: $"
B DB 0AH,0DH,"Output: $"

.CODE
MAIN PROC
   MOV AX,@DATA
   MOV DS,AX 
   
   
   MOV AH,9   ;SHOWING THE STRING OUTPUT OF A
   LEA DX,A
   INT 21H
   
   MOV AH,1   ;TAKING INPUT FOR 1
   INT 21H
   MOV BH,AL 
   
   MOV AH,1   ;TAKING INPUT FOR 1
   INT 21H
   MOV CH,AL
   
   
   MOV AH,9    
   LEA DX,B
   INT 21H
   
   ADD BH,20H   ;ADDING 20H(Hexa value of 32)
   ADD CH,20H
   
   MOV AH,2
   MOV DL,BH  
   INT 21H
            
   MOV AH,2
   MOV DL,CH  
   INT 21H  
   
   MAIN ENDP
END MAIN
   
   
   
   