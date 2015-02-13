
	;; parameter RSI

strlen:
	XOR	rcx, rcx
	XOR	rax, rax
	CMP	[rsi + rax], rcx
	JZ	_strlen_end
	INC	rax

_strlen_end:
	RET
