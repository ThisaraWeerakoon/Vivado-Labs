; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
Start:
        MOV     AL,9E   ; 10011110 Display 3 as first digit.Index 210536
        OUT     02      ; Send the data in AL to Port 02

        MOV     AL,FD   ; 10011110 Display 6 as 2nd digit
        OUT     02      ; Send the data in AL to Port 02

        JMP     Start

        END
; ======================================================
