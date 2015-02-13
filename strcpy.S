
 	;; 2 arguments, RSI, RDI
xstrcpy:


_strcpy_loop:
	MOV	[RDI], [RSI]
	CMP	[RSI], 0
	INC 	RSI
	INC 	RDI
	JZ	_strcpy_loop

_strcpy_loop_end:
	MOV	RAX, RDI
	RET
