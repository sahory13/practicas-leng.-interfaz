; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6 incremento y decremento
; Descripción: El programa pide ingresar un PIN y nos da 3 intentos para escribirlo correctamente. Si acertamos, permite el acceso, pero si fallamos los 3 intentos, muestra un mensaje de bloqueo




INCLUDE Irvine32.inc

.data

	msgPIN BYTE "Ingrese el PIN: ", 0 
	msgIntentos BYTE "Intentos restantes: ", 0
	msgError BYTE "PIN incorrecto.", 0
	msgAcceso BYTE "Acceso permitido.", 0
	msgBloqueado BYTE "Autodestruccioin comenzada...", 0

	pinCorrecto = 1234 

.code 
main PROC
	
	mov ebx, 3 ; tenemos tres intentos para dar con el pin correcto

intentar: 
	mov edx, OFFSET msgPIN
	call WriteString

	call ReadInt   ; leemos el pin ingresado por el usuario y lo guardamos en eax

	cmp eax, pinCorrecto  

	je acceso  ; si el pin es correcto saltamos a la etiqueta acceso

	mov edx, OFFSET msgError
	call WriteString 
	call crlf 
	
	dec ebx   ; restamos un intento cada vez que fallamos

	jz bloqueado   ; si ya no nos quedan intentos saltamos a la etiqueta bloqueado

	mov edx, OFFSET msgIntentos  ; mostramos cuantos intentos nos quedan
	call WriteString

	mov eax, ebx
	call WriteDec 
	call crlf

	jmp intentar   ; volvemos a pedir el codigo si quedan intentos

acceso:
	mov edx, OFFSET msgAcceso
	call WriteString
	call crlf
	jmp fin 

bloqueado:   ; aqui llegamos si fallamos los tres intentos

	mov edx, OFFSET msgBloqueado 
	call WriteString
	call crlf
	jmp fin
fin: 
	exit

main ENDP

END main