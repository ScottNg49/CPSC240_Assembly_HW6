TITLE Sort an array from highest to lowest (testasm5.asm)
;     Name: Scott Ng
; Due Date: 05-08-17
; Compiler: Visual Studio 2012
;    Brief: Sort the array from high to low
;         : Selection sort
INCLUDE Irvine32.inc
.data
Array Byte 20, 10, 60, 5, 120, 90, 100, 7, 25, 12
.code
main PROC
	mov ecx, LENGTHOF Array                  ; moving length of array to outer loop
	mov esi, 0                               ; outer loop counter (i)
	mov edi, 0                               ; inner loop counter (j)

L1:
	mov edi, esi                             ; minIndex
	push esi                                 ; saving outer loop counter
	xor eax, eax
	mov esi, edi                             ; moving i + 1 into esi

L2:                                          ; this will be a while loop
	
	inc esi
	mov al, Array[edi]                       ; moving this value to a register
	cmp esi, LENGTHOF Array
	jz L4
	cmp Array[esi], al                       ; comparing next number with previous number
	jg L3
	jmp L2

L3:
	mov edi, esi
	jmp L2


L4:
	pop esi                                  ; restoring outer loop counterq
	xor eax, eax                             ; clearing out contents of eax register
	mov al, Array[esi]                       
	mov ah, Array[edi]
	mov Array[esi], ah
	mov Array[edi], al
	add esi, TYPE Array
	loop L1

L5:

	mov esi, OFFSET Array                  ; sets pointer to address for dwarray
 	mov ecx, LENGTHOF Array                ; sets ecx for number of elements displayed
	mov ebx, TYPE Array                    ; increments by 4 per ecx tick
	call DumpMem                             ; displys memory at esi location

	call DumpRegs                            ; display registers (Kips Library call)
	call WaitMsg                             ; Displays Press any key to continue and waits for key to be pressed
	exit	
main ENDP
END main
