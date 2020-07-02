org 0000h

ljmp start
org 0030h

clr psw.3			//select register bank
clr psw.4

start:
mov dptr , #2000H	//initialize with source address
mov R0 , #40h		//initialize with destination address
mov r2 , #05h
clr a

L1:
	movx a , @dptr	//load accumulator
	mov @R0 , a		//store data
	inc dptr		//increment source memory pointer
	inc R0			//increment destination memory pointer
	djnz R2 , L1	//check for count=0

	here: sjmp here

end