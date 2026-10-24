; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 a 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 8 operaciones aritméticas
; Descripción: realizamos diferentes operaciones matemáticas como sumas restas multiplicaciones y divisiones utilizando números con y sin signo para observar los resultados y las banderas del procesador




INCLUDE Irvine32.inc

.code 
main PROC


	; 1. operaciones: add y sub

	mov eax, 50
	mov ebx, 20

	add eax, ebx   ; sumamos 50+20 y guardamos el resultado en eax

	sub eax, 15    ; restamos 15 al resultado y guardamos en eax

	nop ; no hace nada solo nos sirve como punto de referencia




	  ; 2. CF: acarreo en la suma sin signo

	mov eax, 0
	mov al, 255  ; guardamos el valor maximo de 8 bits sin signo

	add al, 1   ; al sumarle 1 se produce un acarreo y se activa CF

	nop



	; 3. OF: condicion de desbordamiento

	mov eax, 0

	mov al, 127    ; es el valor maximo de 8 bits con signo

	add al, 1   ; al pasar de 127 se activa la bandera OF

	nop




	; 4. MUL: multiplicacion dentro de 32 bits

	mov eax, 25
	mov ebx, 3

	mul ebx    ; multiplicamos eax por ebx el resultado es 75

	nop





	; 5. MUL: producto que necesita mas de 32 bits

	mov eax, 65537
	mov ebx, 65537

	mul ebx    ; multiplicamos dos numeros grandes y el resultado ocupa edx y eax porque ya se supero los 32 bits

	nop 





	; 6. IMUL:multiplicacion con signo

	mov eax, -5

	imul eax, eax, 3  ; multiplicacamos -5 por 3 y obtenemos -15

	nop



	


	; 7. DIV: division sin signo

	mov eax, 125

	mov edx, 0    ; limpiamos edx antes de dividir 

	mov ebx, 12


	div ebx     ; dividimos 125 entre 12 y eax guarda el resultado y edx el residuo

	nop



	  ; 8. IDIV: division con signo

	mov eax, -125

	cdq        ; preparamos edx para dividir  un numero negativo

	mov ebx, 12

	idiv ebx     ; dividimos -125 entre 12 usando numeros con signo

	exit

main ENDP

END main