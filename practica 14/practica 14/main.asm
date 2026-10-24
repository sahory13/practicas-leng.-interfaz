; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 14 registro de existencia de almacen
; Descripción: el programa nos pide ingresar un numero del 1 al 99 revisa que sea valido y obtiene la cifra de las unidades para mostrarla en pantalla




INCLUDE Irvine32.inc

.data
    msgPrompt BYTE "Ingrese una cantidad de 1 a 99: ", 0
    msgError BYTE "Entrada invalida, intente de nuevo.", 0Dh, 0Ah, 0
    msgResultado BYTE "La cantidad de unidades es: ", 0
    msgUnidades BYTE " unidades", 0

    cantidadrecibida DWORD 0
    cantidadactual DWORD 0

    bufferEntrada BYTE 20 DUP(0)

.code
main PROC

pedir:
    mov edx, OFFSET msgPrompt
    call WriteString

    mov edx, OFFSET bufferEntrada
    mov ecx, SIZEOF bufferEntrada - 1
    call ReadString

    ; revisamos que se hayan escrito 1 o 2 caracteres
    cmp eax, 1
    jl mostrar_error

    cmp eax, 2
    jg mostrar_error

    mov ecx, eax
    mov esi, OFFSET bufferEntrada
    mov ebx, 0

validar_loop:
    movzx eax, BYTE PTR [esi]  ; tomamos un caracter de la cadena

    cmp al, '0'
    jb mostrar_error
    cmp al, '9'

    ja mostrar_error   ; si no es un numero mostramos error

    sub eax, '0'    ;convertimos el caracter a numero

    imul ebx, 10

    add ebx, eax      ;vamos formando la cantidad ingresada

    inc esi
    loop validar_loop

    cmp ebx, 1
    jl mostrar_error        ; No permitimos que la cantidad sea cero

    mov cantidadrecibida, ebx

    ; dividimos entre 10 para obtener la cifra de las unidades
    mov eax, cantidadrecibida
    mov edx, 0
    mov ebx, 10
    div ebx

    mov cantidadactual, edx   ; guardamos el residuo de la division

    ; mostramos el resultado
    mov edx, OFFSET msgResultado
    call WriteString

    mov eax, cantidadactual
    call WriteDec

    mov edx, OFFSET msgUnidades
    call WriteString
    call Crlf

    jmp fin

mostrar_error: ; si escribimos algo incorrecto volvemos a pedir el numero
    mov edx, OFFSET msgError
    call WriteString
    jmp pedir

fin:
    exit

main ENDP
END main
