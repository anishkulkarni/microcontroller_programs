org 0000h
start:
	mov r0,#40h
	mov r3,#05h

clr a
	mov b,@r0

back:
	add a,b
	da a
	inc b
	djnz r3,back
	mov r6,a
	mov r7,a

	next: sjmp next

end