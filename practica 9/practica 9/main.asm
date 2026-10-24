; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 9 push y pop
; Descripción: Aprendemos a guardar y recuperar valores utilizando la pila ademas de conservar registros y llamar a un procedimiento para realizar una operacion




INCLUDE Irvine32.inc
.code 
main PROC


	; bloque 1: PUSH Y POP

	mov eax, 500
	push eax     ; guardamos el valor de eax en la pila 
	nop


	mov ebx, 0
	pop ebx    ; recuperamos el valor guardado y lo pasamos a ebx
	nop



	; bloque 2: ORDEN LIFO

	mov eax, 10
	push eax

	mov eax, 20
	push eax

	mov eax, 30
	push eax

	nop

	; sacamos los valores en orden contrario al que entran
	pop eax
	pop ebx
	pop ecx

	nop


	
	; bloque 3: CONSERVAR REGISTROS

	mov eax, 100
	mov ebx, 200

	push eax
	push ebx  ; guardamos los valores originales en la pila

	mov eax, 999
	mov ebx, 888     ; cambiamos los valores de los registros


	pop eax
	pop ebx    ; recuperamos los valores que teniamos al principio




	; bloque 4: CALL Y RET

	mov eax, 50
	mov ebx, 666

	call aumentarDiez ; llamamos al procedimiento para sumarle 10 a eax

	nop

	exit

main ENDP

aumentarDiez PROC
	nop 

	push ebx    ; guardamos ebx para no perder su valor original

	nop

	mov ebx, 10
	add eax, ebx   ; le sumamos 10 a eax

	nop

	pop ebx   ; recuperamos el valor que tenia ebx

	nop

	ret    ; regresamos a donde se llamo el procedimiento

aumentarDiez ENDP

END main