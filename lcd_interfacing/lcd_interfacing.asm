								;calls a time delay before sending next data/command
								;P2.0-P2.7 are connected to LCD data pins D0-D7
								;P1.0 is connected to RS pin of LCD
								;P1.1 is connected to R/W pin of LCD
								;P1.2 is connected to E pin of LCD
	
	ORG 	0H
	MOV 	A,#38H 				;INIT. LCD 2 LINES, 5X7 MATRIX
	ACALL 	COMNWRT 			;call command subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#0EH 				;display on, cursor on
	ACALL 	COMNWRT 			;call command subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#01 				;clear LCD
	ACALL 	COMNWRT 			;call command subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#06H 				;shift cursor right
	ACALL 	COMNWRT 			;call command subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#0C1H 			;cursor at line 1, pos. 4
	ACALL 	COMNWRT 			;call command subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#'H' 				;display letter H
	ACALL 	DATAWRT 			;call display subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#'E' 				;display letter E
	ACALL 	DATAWRT 			;call display subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#'L' 				;display letter L
	ACALL 	DATAWRT 			;call display subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#'L' 				;display letter L
	ACALL 	DATAWRT 			;call display subroutine
	ACALL 	DELAY 				;give LCD some time
	MOV 	A,#'O' 				;display letter O
	ACALL 	DATAWRT 			;call display subroutine

AGAIN:
	SJMP 	AGAIN 				;stay here

COMNWRT: 						;send command to LCD
	MOV 	P2,A 				;copy reg A to port 1
	CLR 	P1.0 				;RS=0 for command
	CLR 	P1.1 				;R/W=0 for write
	SETB 	P1.2 				;E=1 for high pulse
	ACALL 	DELAY 				;give LCD some time
	CLR 	P1.2 				;E=0 for H-to-L pulse
	RET

DATAWRT: 						;write data to LCD
	MOV 	P2,A 				;copy reg A to port 1
	SETB 	P1.0 				;RS=1 for data
	CLR 	P1.1 				;R/W=0 for write
	SETB 	P1.2 				;E=1 for high pulse
	ACALL 	DELAY 				;give LCD some time
	CLR 	P1.2 				;E=0 for H-to-L pulse
	RET

DELAY: 
	MOV 	R3,#50 				;50 or higher for fast CPUs
	HERE2:
		MOV 	R4,#255 		;R4 = 255
		HERE:
			DJNZ 	R4,HERE 	;stay until R4 becomes 0
		DJNZ 	R3,HERE2		;stay until R3 becomes 0
	RET

END