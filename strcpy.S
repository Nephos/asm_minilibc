 	;; 2 arguments, RDI, RSI
	SECTION	.text
	GLOBAL	strcpy
strcpy:
	XOR	rcx, rcx
_strcpy_loop:
	CMP	byte [rsi + rcx], BYTE 0
	JE	_strcpy_end
	MOV	al, BYTE [rsi + rcx]
	MOV	BYTE [rdi + rcx], al
	INC	rcx
	JMP	_strcpy_loop
_strcpy_end:
	MOV	[rdi + rcx], BYTE 0
	MOV	rax, rdi
	RET

 	;; 3 arguments, RDI, RSI, RDX
	SECTION	.text
	GLOBAL	strncpy
strncpy:
	XOR	rcx, rcx
	DEC	rcx
_strncpy_loop:
	CMP	rdx, rcx
	JE	_strncpy_end
	CMP	byte [rsi + rcx], BYTE 0
	JE	_strncpy_loop_end
	MOV	al, BYTE [rsi + rcx]
	MOV	BYTE [rdi + rcx], al
	INC	rcx
	JMP	_strncpy_loop
;; until the \0, create \0 in the string
_strncpy_loop_end:
	CMP	rdx, rcx
	JE	_strncpy_end
	MOV	BYTE [rdi + rcx], 0
	INC	rcx
	CMP	byte [rsi + rcx], BYTE 0
	JE	_strncpy_loop_end
	JMP	_strncpy_loop
_strncpy_end:
	MOV	rax, rdi
	RET
