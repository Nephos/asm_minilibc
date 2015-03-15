
	SECTION .text
	GLOBAL memcpy

	;; 3 parameters RDI, RSI, RDX
memcpy:
	PUSH	rdi

_memcpy_loop:
	CMP	rdx, 0
	JE	_memcpy_end
	MOV	ecx, [rsi]
	MOV	[rdi], ecx
	DEC	rdx
	INC	rdi
	INC	rsi
	JMP	_memcpy_loop

_memcpy_end:
	POP	rax
	RET
