; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 12 desplazamientos y rotacion
; Descripción: implementamos instrucciones de desplazamiento y rotacion para mover los bits hacia la izquierda o derecha observando como cambian los valores y como se conserva el signo en algunas operaciones





INCLUDE Irvine32.inc

.code
main PROC

    ; limpiamos los registros antes de comenzar
    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0


    ; 1. SHL: desplazar una posicion a la izquierda

    mov al, 00001100b

    shl al, 1    ; movemos los bits a la izquierda y agregamos un 0 al final

    call DumpRegs
    call WriteBin
    call Crlf


    ; 2. SHR: desplazar una posicion a la derecha

    mov al, 00001101b

    shr al, 1          ; movemos los bits a la derecha y se pierde el ultimo bit

    call DumpRegs
    call WriteBin
    call Crlf


    ; 3. SAR: conservar el signo

    mov al, -8
    sar al, 1     ; desplazamos a la derecha manteniendo el signo negativo

    call DumpRegs
    call WriteBin
    call Crlf


    ; 4. SAR: con operaciones no exactas

    mov al, 9
    sar al, 1   ; al desplazar 9 obtenemos 4 porque se pierde el bit sobrante

    call DumpRegs
    call WriteBin
    call Crlf


    ; 5. desplazar 2 bits a la izquierda

    mov al, 00001111b
    shl al, 2       ; movemos dos posiciones en lugar de una

    call DumpRegs
    call WriteBin
    call Crlf


    ; 6. desplazar 2 bits a la derecha usando cl

    mov al, 00001111b
    mov cl, 2     ; CL indica cuantas posiciones queremos mover
    shr al, cl

    call DumpRegs
    call WriteBin
    call Crlf


    ; 7. ROTACIONES: ROR, ROL, RCL Y RCR

    ; ROL: rotacion a la izquierda
    mov al, 10000001b

    rol al, 1    ; el bit que sale por la izquierda vuelve por la derecha

    call DumpRegs
    call WriteBin
    call Crlf


    ; ROR: rotacion a la derecha
    mov al, 10000001b
    ror al, 1      ; el bit que sale por la derecha vuelve por la izquierda

    call DumpRegs
    call WriteBin
    call Crlf


    ; RCL: rotacion a la izquierda con acarreo   

    clc         ;ponemos la bandera CF en 0

    mov al, 10000001b

    rcl al, 1      ; rotamos los bits tomando en cuenta la bandera CF

    call DumpRegs
    call WriteBin
    call Crlf


    ; RCR: rotacion a la derecha con acarreo
    clc
    mov al, 00000001b

    rcr al, 1      ; rotamos a la derecha pasando por la bandera CF

    call DumpRegs
    call WriteBin
    call Crlf

    exit

main ENDP
END main
