
	;; 2 arguments, RSI, RDI
strcmp:
	PUSH 	RSI
	PUSH 	RDI
	PUSH 	RAX

_strcmp_loop:
	MOV	RAX, [RSI]
	SUB 	RAX, [RDI]
	JA 	_strcmp_loop_end_more
	JB 	_strcmp_loop_end_less
	CMP	RAX, [RDI]
	JZ 	_strcmp_loop_end_zero

_strcmp_loop_next:
	INC 	RSI
	INC 	RDI
	JMP 	_strcmp_loop

_strcmp_loop_end_zero:
	MOV 	RAX, 0
	JMP	_strcmp_end

_strcmp_loop_end_more:
	MOV 	RAX, 1
	JMP 	_strcmp_end

_strcmp_loop_end_less:
	MOV 	RAX, -1
	JMP 	_strcmp_end

_strcmp_end:
	POP 	RAX
	POP 	RDI
	POP 	RSI
	RET
