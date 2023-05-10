; ===== CALCULATE 1X2X3X4X5 ======================================
        CLO             ; Close unwanted windows.
        MOV CL,5        ; Copy a 5 into the CL register.
        MOV BL,4        ; Copy a 4 into the BL register.

;Decrement value of BL from 4 to 1 while storing the value of
multiplication in CL
Rep:
        MUL CL,BL       ; Multiply CL and BL. Answer goes into CL.
        DEC     BL      ; Subtract one from BL.
        JNZ     REP     ; Jump back to Rep if BL was not Zero.

;Answer stored in CL and answer is 78 in hexa decimal

Start:
        ;Display 7
        MOV     AL,8A   ; 1111 1010
        OUT     02      ; Send the data in AL to Port 02


        ;Display 8
        MOV     AL,FF   ; 1111 1111
        OUT     02      ; Send the data in AL to Port 02



        JMP     Start
         END            ; Program ends
; ===== Program Ends ===========================================
