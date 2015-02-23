
	SECTION	.text
	GLOBAL	strchr

	;; 2 arguments, RDI, RSI
strchr:
	XOR	rcx, rcx

_strchr_loop:
	CMP	sil, BYTE [rdi + rcx]
	JE	_strchr_end_found
	CMP	[rdi + rcx], DWORD 0
	JE	_strchr_end_notfound
	INC	rcx
	JMP	_strchr_loop

_strchr_end_notfound:
	XOR	rax, rax
	RET

_strchr_end_found:
	MOV	rax, rdi
	ADD	rax, rcx
	RET
