
	GLOBAL	strcmp

	;; 2 arguments, RSI, RDI
strcmp:
	PUSH 	rsi
	PUSH 	rdi

_strcmp_loop:
	MOV	rax, [rsi]
	SUB 	rax, [rdi]
	JA 	_strcmp_loop_end_less
	JB 	_strcmp_loop_end_more
	CMP	rax, [rdi]
	JZ 	_strcmp_loop_end_zero

_strcmp_loop_next:
	INC 	rsi
	INC 	rdi
	JMP 	_strcmp_loop

_strcmp_loop_end_zero:
	MOV 	rax, 0
	JMP	_strcmp_end

_strcmp_loop_end_more:
	MOV 	rax, 1
	JMP 	_strcmp_end

_strcmp_loop_end_less:
	MOV 	rax, -1
	JMP 	_strcmp_end

_strcmp_end:
	POP 	rdi
	POP 	rsi
	RET
