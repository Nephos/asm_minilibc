	;; 3 parameters RDI, RSI, RDX
	SECTION .text
	GLOBAL memcpy
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

	;; 3 parameters, RDI, RSI, RDX
	SECTION .text
	GLOBAL memmove
	EXTERN malloc
	EXTERN free
memmove:
	PUSH	rdi
	PUSH	rsi
	PUSH	rdx		; dest, src, size
	;; alloc tmp
	MOV	rax, rdx
	CALL	malloc WRT ..plt
	;; copy source to tmp
	MOV	rdi, rax
	POP	rdx
	POP	rsi
	PUSH	rdx
	PUSH 	rax		; dest, size, tmp
	CALL	memcpy
	;; copy tmp to dest
	POP	rsi
	POP	rdx
	POP	rdi
	PUSH	rdi		; tmp
	CALL	memcpy
	;; free
	POP	rdi
	PUSH	rax		; dest
	CALL	free WRT ..plt
	;; end
	POP	rax
	JMP	_memmove_end

_memmove_malloc_failed:
	XOR	rax, rax
_memmove_end:
	RET
