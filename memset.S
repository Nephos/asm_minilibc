
	;; parameters RDI, RSI, RDX
memset:
	CMP	RDX, 0
	JZ	_memset_end
	MOV	[rdi + rdx], esi
	INC	rdx

_memset_end:
	MOV	RAX, RDX
	RET
