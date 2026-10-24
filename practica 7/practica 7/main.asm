; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 7  Validacion de formato
; Descripción: El programa revisa que una cadena tenga exactamente 7 caracteres, comenzando con 3 letras mayúsculas, después un guion y terminando con 3 números. Si cumple con las reglas, muestra un mensaje de validación



NCLUDE Irvine32.inc

.data
	msgValido BYTE "LA CADENA CUMPLE CON LAS REGLAS", 13, 10, 0
	msgNoValido BYTE "NO CUMPLE CON LAS REGLAS", 13, 10, 0

	buffer BYTE 50 DUP(0)    ;reservamos el espacio para guardar la cadena

.code
main PROC
	mov edx, OFFSET buffer
	mov ecx, 50

	call ReadString     ; leemos la cadena que escriba el usuario
	
	cmp eax, 7 ; Validar que mida exactamente 7 caracteres

	jne invalido   ; si no tiene 7, la cadena no es valida
 
	mov ecx, 3  ; vamos a revisar las primeras 3 letras

	mov esi, OFFSET buffer    ; ESI nos ayuda a recorrer la cadena 

Validarletras:
	mov al, [esi]   ; tomamos el caracter que estamos revisando

	cmp al, 'A'  ; si esta antes de la A no es vaalido


	jb invalido

	ja invalido

	cmp al, 'Z'   ; si pasa de la Z tampoco es valido

	inc esi    ; avanzamos al siguiente caracter

	loop Validarletras   ; repetimos hasta revisar las 3 letras

	mov al, [esi]

	cmp al, '-'   ; revisamos que el siguiente caracter sea un guion

	jne invalido
	inc esi

	mov ecx, 3    ; ahora vamos a revisar los ultimos 3 digitos

Validardigitos:
	mov al, [esi]
	cmp al, '0'

	jb invalido    ;si esta antes que el 0 no es un numero

	cmp al, '9'

	ja invalido   ; si pasa del 9 tampoco es un numero

	inc esi
	loop Validardigitos


esValido:      ; si paso todas las revisiones mostramos que es valido
	mov edx, OFFSET msgValido
	call WriteString
	jmp fin


invalido:     ; si falla alguna condicion mostramos que no cumple las reglas
	mov edx, OFFSET msgNoValido
	call WriteString

fin:
	call Crlf
	exit

main ENDP
END main