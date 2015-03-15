	;; 2 arguments, RDI, RSI
	SECTION	.text
	GLOBAL	strcmp
strcmp:
	PUSH	rbx
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
	POP	rbx
	RET

	;; 3 arguments, RDI, RSI, RDX
	SECTION	.text
	GLOBAL	strncmp
strncmp:
	PUSH	rbx
	XOR	rcx, rcx
	XOR	rax, rax
	XOR	rbx, rbx
_strncmp_loop:
	CMP	rdx, rcx
	JE	_strncmp_end_zero
	MOV	al, BYTE [rdi + rcx]
	MOV	bl, BYTE [rsi + rcx]
	CMP	al, bl
	JNE 	_strncmp_end
	CMP	al, BYTE 0
	JE 	_strncmp_end
	INC 	rcx
	JMP 	_strncmp_loop
_strncmp_end:
	SUB	eax, ebx
	POP	rbx
	RET
_strncmp_end_zero:
	XOR	rax, rax
	POP	rbx
	RET
