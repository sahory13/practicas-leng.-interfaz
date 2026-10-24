; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5 condicionales 
; Descripción: Compara dos números utilizando condicionales para determinar si son iguales o diferentes y mostrar el resultado en pantalla


INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ebx, 1  ; iniciamos guardadon del numero 1 en ebx
	
ciclo:
	cmp ebx, 10   ; comparamos el valor de ebx con 10

	jg fin   ;si el numero ya es mayor que 10, saltamos a fin

	mov eax, ebx   ; pasamos el numero a eax para poder mosratrlo en pantalla

	call WriteDec   ; mostramos el numero en pantalla

	call Crlf     ; regresamos a repetir el ciclo

	inc ebx 

	jmp ciclo 
	
fin:
	exit  ; terminamos el programa

main ENDP
END main