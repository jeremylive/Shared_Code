;falta agregar signos
;imprime en binario ----------------------------------------------------
%macro PutBin 1
	push eax
	push ebx
	push ecx
	push edx
	mov eax,%1 
	xor ecx, ecx
	dec ecx
%%zero_loop:
	inc ecx
	rol eax,1
	mov ebx, eax
	and ebx, 00000001h
	
	cmp ecx, 31 ;condicion de parada
	jae %%end
	
	cmp ebx,0
	je %%zero_loop
	
	PutCh '1'
%%print_loop:
	inc ecx
	rol eax,1
	mov ebx, eax
	and ebx, 00000001h
	add bl, '0'
	PutCh bl

	cmp ecx, 31
	jb %%print_loop
%%end:
	PutCh 'b'
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

;imprime en octal-------------------------------------------------------

%macro PutOct 1
	push eax
	push ebx
	push ecx
	push edx
	mov eax,%1 
	xor ecx, ecx
	dec ecx
	
	rol eax, 2
	mov ebx, eax
	and ebx,3
	cmp ebx, 0 
	je %%zero_loop
	add bl, '0'
	PutCh bl
	jmp %%print_loop
%%zero_loop:
	inc ecx
	rol eax,3
	mov ebx, eax
	and ebx, 00000007h
	
	cmp ecx, 9 ;condicion de parada
	jae %%end
	
	cmp ebx,0
	je %%zero_loop
	
	add bl,'0'
	PutCh bl
%%print_loop:
	inc ecx
	rol eax,3
	mov ebx, eax
	and ebx, 00000007h
	add bl, '0'
	PutCh bl

	cmp ecx, 9
	jb %%print_loop
%%end:
	PutCh 'o'
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

;imprime en hexadecimal-------------------------------------------------
%macro PutHex 1
	push eax
	push ebx
	push ecx
	push edx
	mov eax,%1 
	xor ecx, ecx
	dec ecx
%%zero_loop:
	inc ecx
	rol eax,4
	mov ebx, eax
	and ebx, 0000000Fh
	
	cmp ecx, 8 ;condicion de parada
	jae %%end
	
	cmp ebx,0
	je %%zero_loop
	
	printN ebx
	
	cmp ecx, 7
	jae %%end
%%print_loop:
	inc ecx
	rol eax,4
	mov ebx, eax
	and ebx, 0000000Fh
	printN ebx

	cmp ecx, 7
	jb %%print_loop
%%end:
	PutCh 'h'
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro

%macro printN 1
	push eax
	push ebx
	push ecx
	push edx
	mov ebx, %1

	cmp bl, 9
	jg %%leter
	add bl, '0'
	PutCh bl
	jmp %%end
%%leter:	
	sub bl, 10
	add bl, 'A'
	PutCh bl
	
%%end:
	pop edx
	pop ecx
	pop ebx
	pop eax
%endmacro
