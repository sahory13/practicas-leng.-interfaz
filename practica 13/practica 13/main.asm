; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13 extraccion
; Descripción: convertimos un numero hexadecimal de 32 bits en una cadena de 8 caracteres utilizando operaciones de bits para obtener cada digito y mostrar el resultado en pantalla




INCLUDE Irvine32.inc

.data
    valor DWORD 12AB34CDh

    bufferHex BYTE 9 DUP(?)      ; guardamos los 8 caracteres y el espacio para el cero final

.code
main PROC

    mov eax, valor

    mov bufferHex[8], 0  ; marcamos donde termina la cadena

    mov esi, 7               ; empezamos desde la ultima posicion del buffer

bucle:
    mov dl, al

    and dl, 0Fh    ; nos quedamos solo con los ultimos 4 bits

    cmp dl, 9    ; revisamos si el valor es un numero o una letra

    jbe es_numero      ; si es de 0 a 9 saltamos a es_numero

    add dl, 'A' - 10       ; convertimos los valores de 10 a 15 en letras de A a F

    jmp guardar

es_numero:
    add dl, '0'      ; convertimos el valor en un caracter del 0 al 9

guardar:
    mov bufferHex[esi], dl  ;guardamos el caracter en el buffer

    shr eax, 4        ;movemos 4 bits para obtener el siguiente digito

    dec esi     ; retrocedemos una posicion en el buffer

    jge bucle      ; repetimos hasta completar los 8 caracteres



    ; mostramos el numero hexadecimal convertido en texto

    mov edx, OFFSET bufferHex
    call WriteString
    call Crlf

    exit

main ENDP
END main
