; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4.1 Saltos
; Descripción: el programa nos pide escribir dos números y después los compara para saber si son iguales o si el primero es mayor o menor que el segundo


INCLUDE Irvine32.inc

.data

    prompt2 BYTE "Escribe el primer numero: ", 0
    prompt1 BYTE "Escribe el segundo numero: ", 0

    msgDiferentes BYTE "Los numeros son diferentes. ", 0
    msgMenor BYTE "El primer numero es menor.", 0
    msgIguales BYTE "Los numeros son iguales.", 0
    msgEsmayoroigual BYTE "El primer numero es mayor.", 0


.code
main PROC

	mov edx, OFFSET prompt2  ; guardamos la direccion del mensaje para pedir el primer numero

	call WriteString  ;mostramos el mensaje en pantalla

	call ReadInt  ; leemos el primer numero y lo guardamos en eax

	mov ecx, eax  ; guardamos el primer numero en ecx para compararlo despues

	mov edx, OFFSET prompt1  ; guardamos la direccion del mensaje para pedir el segundo numero

	call WriteString   ; mostramos el mensaje en pantalla

	call ReadInt     ; leemos el segundo numero y lo guardamos en eax

	mov ebx, eax     ; guardamos el segundo numero en ebx para compararlo despues

	mov eax, ecx  ; pasamos el primer numero a eax para compararlo con el segundo

	mov ebx, ebx    ; pasamos el segundo numero a ebx para compararlo con el primero
	
	cmp eax, ebx   ; comparamos los dos numeros

	je iguales ; si son iguales saltamos a la etiqueta iguales

	mov edx, OFFSET msgDiferentes ; si los numeros son diferentes llegaremos a esta instruccion 

	call WriteString ; mostramos el mensaje de que son diferentes

	jge mayor   ; si el primer numero es mayor saltamos a la etiqueta mayor (jge significa mayor o igual)

	mov edx, OFFSET msgMenor ; si el primer numero es menor llegaremos a esta instruccion

	call WriteString   ; mostramos el mensaje de que es menor 

	jmp fin  ; nos vamos al final porque ya encontramos el resultado


	
iguales:
	mov edx, OFFSET msgiguales  ; si los numeros son iguales llegaremos a esta instruccion
	call WriteString  ; mostramos el mensaje de que son iguales en pantalla

mayor:
	mov edx, OFFSET msgEsmayoroigual  ; si el primer numero es mayor llegaremos a esta instruccion
	call WriteString  ; mostramos el mensaje de que es mayor en pantalla

fin:
	call Crif  ; mostramos un salto de línea

	exit ; terminamos el programa

main ENOP
END main