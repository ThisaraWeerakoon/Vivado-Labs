; ===== CONTROL THE TRAFFIC LIGHTS =============================

        CLO             ; Close unwanted windows.
Start:

                        ; Turn on Red in left and green in right.
        MOV AL,84       ; Copy 10000100 into the AL register.
        OUT 01          ; Send AL to Port One (The traffic lights).


        MOV     BL,A    ; A 10 cpu cycle delay.
        CALL    30      ; Call the procedure at address [30]


                         ; Turn on yellow lights in both left and right
        MOV AL,48       ; Copy 01001000 into the AL register.
        OUT 01          ; Send AL to Port One (The traffic lights).

        MOV     BL,1    ; A 1 cpu cycle delay.
        CALL    30      ; Call the procedure at address [30]

                        ; Turn on green light on left and red light on right
        MOV AL,30       ; Copy 01001000 into the AL register.
        OUT 01          ; Send AL to Port One (The traffic lights).

        MOV     BL,5    ; A 1 cpu cycle delay.
        CALL    30      ; Call the procedure at address [30]


        JMP Start       ; Jump back to the start.

; ----- Time Delay Procedure Stored At Address [30] -------------
        ORG     30      ; Generate machine code from address [30]

        PUSH    BL      ; Save AL on the stack.
        PUSHF           ; Save the CPU flags on the stack.
Rep:
        DEC     BL      ; Subtract one from AL.
        JNZ     REP     ; Jump back to Rep if AL was not Zero.

        POPF            ; Restore the CPU flags from the stack.
        POP     BL      ; Restore AL from the stack.

        RET             ; Return from the procedure.
; ---------------------------------------------------------------

        END             ; Program ends.
