; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 11 operaciones logicas
; Descripción: utilizamos operaciones lógicas como AND OR XOR NOT y TEST para cambiar y revisar los estados de una computadora





INCLUDE Irvine32.inc

.data
    msgAlarma BYTE "La alarma esta encendida.", 0
    msgSinAlarma BYTE "La alarma esta apagada.", 0

.code
main PROC

    ; 0 encendido
    ; 1 alarma
    ; 2 conectado
    ; estado inicial: 00000101


    ; 1. AND: estado de encendido

    mov eax, 0
    mov ebx, 0
    mov al, 00000101b
    mov bl, al
    and bl, 00000001b  ;revisamos solo el bit de encendido

    nop
    call DumpRegs


    ; 2. OR: encender alarma

    mov al, 00000101b
    or al, 00000010b   ;activamos el bit de la alarma sin cambiar los demas

    call DumpRegs
    nop


    ; 3. XOR: desconectar y conectar computadora

    mov al, 00000101b
    xor al, 00000100b  ; cambiamos el bit de conexion de 1 a 0

    call DumpRegs
    nop


    ; 4. NOT: invertir estados
    mov al, 00000101b
    not al             ; cambiamos todos los bits los 1 pasan a 0 y viceversa

    call DumpRegs
    nop


    ; 5. TEST: revisar la alarma y realizar un salto

    mov al, 00000010b

    test al, 00000010b  ; Revisamos si el bit de la alarma esta activado

    jnz alarmaActiva    ; Si el resultado no es cero la alarma esta encendida

    mov edx, OFFSET msgSinAlarma
    call WriteString
    jmp fin

alarmaActiva:
    ; llegamos aqui cuando la alarma esta encendida
    mov edx, OFFSET msgAlarma
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main
