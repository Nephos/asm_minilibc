
	SECTION	.text
	GLOBAL strdup

	EXTERN strlen
	EXTERN malloc
	EXTERN memcpy

	;; 1 argument RDI
strdup:
	PUSH	rdi
	CALL	strlen WRT ..plt
	INC	rax
	PUSH	rax
	MOV	rax, rdi
	CALL	malloc WRT ..plt
	MOV	rdi, rax	; rdi = ptr to new str
	POP	rdx		; rax = len
	POP	rsi		; rsi = ptr to old str
	CALL	memcpy WRT ..plt

_strdup_end:
	MOV	rax, rdi
	RET
