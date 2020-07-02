org 0000h
start:
	mov r0,#40h
	mov r3,#05h

clr a

back:
	mov b,@r0
	add a,b
	inc r0
	djnz r3,back
	mov r6,a
	mov r7,a

	next: sjmp next

end