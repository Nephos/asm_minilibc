
	SECTION	.text
	GLOBAL	strcmp

	;; 2 arguments, RSI, RDI
strcmp:
	XOR	rcx, rcx
	XOR	eax, eax

_strcmp_loop:
	MOV	al, BYTE [rsi + rcx]
	CMP	BYTE [rdi + rcx], al
	JNE 	_strcmp_end
	CMP	al, BYTE 0
	JE 	_strcmp_end
	INC 	rcx
	JMP 	_strcmp_loop

_strcmp_end:
	XOR	edx, edx
	MOV	dl, BYTE [rdi + rcx]
	SUB	edx, eax
	MOV	eax, edx
	RET
