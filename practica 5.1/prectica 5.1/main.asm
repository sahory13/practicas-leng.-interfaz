; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5.1 "repetir hasta que el usuario ingrese 0"
; Descripción: Ciclo que solicita la entrada de números y se repite hasta ingresar un cero


INCLUDE Irvine32.inc

.data
	prompt BYTE "Ingrese un numero (0 para salir): ", 0

.code
main PROC

ciclo:	
	mov edx, OFFSET prompt  ; preparamos el mensaje para mostrarlo

	call WriteString  ; pedimos que el usuario ingrese un número
	
	call ReadInt   ; leemos el numero que el usuario ingreso

	call Crlf     ; damos un salto de linea

	cmp eax, 0    ; comparamos el número ingresado con cero

	jne ciclo    ; si el numero es diferente a cero repetimos el ciclo

	exit  ; terminamso el programa 

main ENDP
END main