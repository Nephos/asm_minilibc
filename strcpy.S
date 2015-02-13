
	SECTION	.text
	GLOBAL	strcpy

 	;; 2 arguments, RSI, RDI
strcpy:
	XOR	rcx, rcx

_strcpy_loop:
	CMP	byte [rsi + rcx], BYTE 0
	JE	_strcpy_loop_end
	MOV	al, BYTE [rsi + rcx]
	MOV	BYTE [rdi + rcx], al
	INC	rcx
	JMP	_strcpy_loop

_strcpy_loop_end:
	MOV	[rdi + rcx], BYTE 0
	MOV	rax, rdi
	RET
