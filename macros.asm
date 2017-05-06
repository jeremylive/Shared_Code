
;;ESPACIO DE MACROS

;;;MACRO DE EXPLICITO A STRBIN

%macro IntToBin 2

	push eax
	push ebx
	push ecx
	push edx
	
	mov eax, %1
	mov ebx, [eax]
	mov ecx, 31
	xor edx, edx
	
	%%while:
	
		dec ecx
		cmp ecx, 0
		je %%salir
		
		ror ebx , 1
		jc %%inicio
		jmp while
		
		
	%%inicio:
		push eax
		mov eax, %2
		mov [eax + edx], '0'
		mov [eax + edx], '1'
		pop eax
		
	%%largo:
	
		dec ecx
		cmp ecx,0
		je %%salir
		
		push eax
		mov eax, %2
		
		ror ebx, 1
		jc %%uno
		jmp %%cero
		
	%%uno:
		
		mov byte[eax + edx], '1'
		pop eax
		jmp %%largo
	
	%%cero:
		
		mov byte[eax + edx], '0'
		pop eax
		jmp %%largo
	
	%%salir:
		
		PutCh '^'
		PutStr string
		
		
	
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro

;;;MACRO DE EXPLICITO A STROCT
%macro IntToOct 1

	push eax
	push ebx
	push ecx
	push edx
	
	
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro

;;;MACRO DE EXPLICITO A STRDEC

%macro IntToDec 1

	push eax
	push ebx
	push ecx
	push edx
	
	
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro

;;;MACRO DE EXPLICITO A STRHEX

%macro IntToHex 1

	push eax
	push ebx
	push ecx
	push edx
	
	
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro




;;;MACRO DE HEXADECIMAL A EXPLICITO (BINARIO)

%macro HexToInt 2 

;;; IN:  "H000B"
;;; OUT: 0000 0000 0000 1011 (11)

	push eax
	push ebx
	push ecx
	push edx

	xor eax,eax
	xor ebx, ebx
	xor ecx, ecx
	
	
	mov eax, %1
	mov ecx, %2
	
%%ite:

	mov ch, [eax] 
	
	sub ch, 30H
	cmp ch, 9
	jg %%no_number
	
	
	cmp ch, 0
	jl %%no_valid
	
	add bl, ch
	
	dec cl
	
	cmp cl, 0
	je %%salir
	
	
	rol ebx, 4
	
	
	inc eax
	
	jmp %%ite
	


%%no_number:

	sub ch, 17
	cmp	ch, 5
	jg %%no_valid
	add ch, 10
	
	add bl, ch
	
	dec cl
	cmp cl, 0
	je %%salir
		
		
	rol ebx, 4
	
	inc eax
	 
	jmp %%ite
	
%%no_valid:
	PutStr error_variableMsg2
	xor ebx, ebx
	
%%salir: 
	PutCh '('
	PutLInt ebx
	PutCh ')'
	
	mov [aux], ebx 
	
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro


;;;MACRO DE OCTAL A EXPLICITO (BINARIO)


%macro OctToInt 2

;;; IN:  "00000017"
;;; OUT: 0000 0000 0000 1111 (7)
;;;      _--- ___- --__ _---
;;;     (s)(0) (0)(0) (1) (7)

	;PutLInt eax
	PutCh '<'
	PutCh '-'
	push eax
	push ebx
	push ecx
	push edx

	xor eax,eax
	xor ebx, ebx
	xor ecx, ecx
	
	
	mov eax, %1
	PutStr eax
	mov ecx, %2
	
%%ite:

	mov ch, [eax] 
	sub ch, 30H
	cmp ch, 7
	jg %%no_valid
	
	cmp ch, 0
	jl %%no_valid
	
	add bl, ch
	
	dec cl
	cmp cl, 0
	je %%salir
	
	rol ebx, 3
	
	inc eax
	jmp %%ite

%%no_valid:
	PutStr error_variableMsg2
	xor ebx, ebx

%%salir:
	
	PutCh '('
	PutLInt ebx
	PutCh ')'
	
	mov [aux], ebx 
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro


;;;MACRO DE BINARIO A EXPLICITO (BINARIO)


%macro BinToInt 2 

;;; IN:  "000101"
;;; OUT: 0000 0000 0000 0101 (5)


	push eax
	push ebx
	push ecx
	push edx

	xor eax,eax
	xor ebx, ebx
	xor ecx, ecx
	
	mov eax, %1
	mov ecx, %2
	
%%ite:

	mov ch, [eax] 
	PutStr eax
	sub ch, 30H
	cmp ch, 1
	jg %%no_valid
	cmp ch, 0
	jl %%no_valid
	
	
	add bl, ch
	
	dec cl
	cmp cl, 0
	je %%salir
	
	rol ebx,1
	
	inc eax
	jmp %%ite

%%no_valid:
	PutStr error_variableMsg2
	xor ebx, ebx

%%salir:
	
	PutCh '('
	PutLInt ebx
	PutCh ')'
	
	mov [aux], ebx 
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
%endmacro



