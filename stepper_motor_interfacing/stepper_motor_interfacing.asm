org 0000h

main:
	mov a,#05h
	mov p0,a
	call delay
	mov a,#09h
	mov p0,a
	call delay
	mov a,#0ah
	mov p0,a
	call delay
	mov a,#06h
	mov p0,a
	call delay
	sjmp main

delay: 
	l2:
		mov r1,#0ffh
		l1:
			mov r3,#0ffh
			l3:
				djnz r3,l3
    			djnz r1,l1
        
	ret

end