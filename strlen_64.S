	;; parameter RDI
	SECTION	.text
	GLOBAL	strlen
strlen:
	XOR	rax, rax
_strlen_loop:
	CMP	[rdi + rax], BYTE 0
	JE	_strlen_end
	INC	rax
	JMP	_strlen_loop
_strlen_end:
	RET
