
	SECTION	.text

	GLOBAL	strcmp
	GLOBAL	strncmp

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
	SUB	eax, edx
	NEG	eax
	RET

	;; 3 arguments, RSI, RDI, RDX

strncmp:
	XOR	rcx, rcx
	XOR	eax, eax
	DEC	rcx

_strncmp_loop:
	CMP	rdx, rcx
	JE	_strcmp_end
	MOV	al, BYTE [rsi + rcx]
	CMP	BYTE [rdi + rcx], al
	JNE 	_strcmp_end
	CMP	al, BYTE 0
	JE 	_strcmp_end
	INC 	rcx
	JMP 	_strncmp_loop
