%macro strpbrk.pushdata 0
	PUSH	rdi
	PUSH	rsi
	PUSH	rcx
	PUSH	rax
%endmacro
%macro strpbrk.popdata 0
	POP	rax
	POP	rcx
	POP	rsi
	POP	rdi
%endmacro

	;; 2 arguments, RDI, RSI
	SECTION	.text
	GLOBAL	strpbrk
	EXTERN	index
strpbrk:
	XOR	rcx, rcx
	MOV	rax, 0
_strpbrk_loop:
	CMP	[rsi + rcx], BYTE 0
	JE	_strpbrk_final	; if the end
	strpbrk.pushdata
	MOV	rsi, [rsi + rcx]
	CALL	index WRT ..plt	; search A CHARACTER of rsi in rdi => rax = ptr
	MOV	r8, rax		; r8 = last ptr
	strpbrk.popdata
	INC	rcx		; i++
_strpbrk_cmp_ptr:
	CMP	rax, 0
	JE	_strpbrk_save_new_ptr ; if no ptr saved, use it
	CMP	r8, rax
	JL	_strpbrk_save_new_ptr ; if the new ptr is better than rax
	JMP	_strpbrk_loop	      ; else returns to the loop
_strpbrk_save_new_ptr:
	MOV	rax, r8		; replace te rax ()
	JMP	_strpbrk_loop
_strpbrk_final:
	;; CMP	rax, 0
	;; JE	_strpbrk_end_null
	;; JMP	_strpbrk_end
;; _strpbrk_end_null:
;; 	XOR	rax, rax
_strpbrk_end:
	RET

	;; 2 arguments, RDI, RSI
	SECTION	.text
	GLOBAL	strcspn
	EXTERN	index
strcspn:
	PUSH	rdi
	PUSH	rsi
	CALL	strpbrk
	POP	rsi
	POP	rdi
	CMP	rax, 0
	JE	_strcspn_end_zero
	SUB	rax, rdi
	JMP	_strcspn_end
_strcspn_end_zero:
	XOR	rax, rax
_strcspn_end:
	RET
