; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4. Saltos
; Descripción: Comparamos dos numeros para saber si son iguales o diferentes


INCLUDE Irvine32.inc

.data
	msgiguales BYTE "Los numeros son iguales.", 13, 10, 0
	msgDiferentes BYTE "Los numeros son diferentes.", 13, 10, 0

.code
main PROC
	mov eax, 10 ; guardamos el primer numero en eax
	mov ebx, 10 ; guardamos el segundo numero en ebx
	
	cmp eax, ebx ; comparamos los numeros 
	je iguales  ; si son iguales nos manda al mensaje "los numeros son iguales" y sino nos manda al menaje "los numeros son diferentes 

	mov edx, OFFSET msgDiferentes
	call WriteString
	jmp fin  ; en caso de que no sean iguales nos manda al final del programa
	
iguales: ; aqui nos manda si los numeros son iguales
	mov edx, OFFSET msgiguales
	call WriteString

fin:
	call Crlf ; damos un salto de linea
	exit ; terminamos el programa

main ENDP
END main