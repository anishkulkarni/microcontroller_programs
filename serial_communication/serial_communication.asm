MOV TMOD,#20H 			;timer 1,mode 2(auto reload)
MOV TH1,#-3 			;9600 baud rate
MOV SCON,#50H 			;8-bit, 1 stop, REN enabled
SETB TR1				;start timer 1

AGAIN:
	MOV A,#048h			;transfer "H"
	ACALL SEND
	MOV A,#045h			;transfer "E"
	ACALL SEND
	MOV A,#04Ch			;transfer "L"
	ACALL SEND
	MOV A,#04Ch			;transfer "L"
	ACALL SEND
	MOV A,#04Fh			;transfer "O"
	ACALL SEND
	MOV A,#02Ah			;transfer "*"
	ACALL SEND
	SJMP AGAIN			;keep doing it

SEND:					;serial data transfer subroutine
	MOV SBUF,A			;load SBUF
	HERE:
		JNB TI,HERE		;wait for the last bit
		CLR TI			;get ready for next byte
		RET

END