; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6.1 Control de ocupación de un estacionamiento
; Descripción: Simulamos un estacionamiento con capacidad para 20 carros donde podemos registrar entradas y salidas evitando que entren mas carros cuando está lleno o que salgan cuando esta vacio


INCLUDE Irvine32.inc

.data
	msgMax BYTE "Estacionamiento lleno", 13, 10, 0
	msgMenu BYTE "1. Entrar carro | 2. Salir carro | 0. Cerrar. Opcion: ", 0
	msgActual BYTE "Carros en estacionamiento: ", 0
	msgVacio BYTE "El estacionamiento ya esta vacio.", 13, 10, 0

.code
main PROC

	mov ebx, 20 ; Limite de carros (20)

	mov ecx, 0  ; empezamos con el estacionamiento vacio 

menu:   ; mostramos cuantos carros hay actualmente
	mov edx, OFFSET msgActual
	call WriteString
	mov eax, ecx
	call WriteDec
	call Crlf


	; mostramos el menu y leemos la que el usuario elija
	mov edx, OFFSET msgMenu
	call WriteString
	call ReadInt
	call Crlf
	


	cmp eax, 0
	je fin   ; si elegimos 0 cerramos el programa


	cmp eax, 1
	je entro  ; si elegimos 1 registramos la entarda de un carro


	cmp eax, 2
	je salio    ; si elegimos 2 registramos la salida de un carro
	


	jmp menu   ; si ponemos otra opcion volvemos a mostrar el menu


entro:
	cmp ecx, ebx    ; revisamos si ya llegamos al limite de carros
	
	jge maximo   ; si esta lleno nos manda al mensaje de maximo
	
	inc ecx    ; sumamos un carro al estacionamiento
	jmp menu


salio:
	cmp ecx, 0     ;revisamos si el estacionamiento esta vacio
	
	je estavacio     ; si esta vacio nos manda al mensaje vacio 
	
	dec ecx   ; retsamos un carro porque acaba de salir             
	jmp menu


estavacio:   ; mostramos este mensaje si queremos sacar un carro y no hay ninguno
	mov edx, OFFSET msgVacio
	call WriteString
	jmp menu

maximo:   ; avisamos que ya no hay espacio para mas carros
	mov edx, OFFSET msgMax
	call WriteString
	jmp menu

fin:
	exit  ; termina el prgrama 

main ENDP
END main