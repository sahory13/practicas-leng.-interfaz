;Materia: Lenguajes de interfaz
;Alumno: Estrada Trejo sahory
;Horario 8:00-9:00
;Docente: Dr. José Luis Medina Jiménez
;Practica 1 "comparación y prueba"   
;Descripción: En esta práctica revisamos cómo funcionan las banderas del procesador cuando hacemos comparaciones y operaciones


INCLUDE Irvine32.inc   

.code
main PROC

    ; CONDICION 1: Zero FLAG (ZF) esta bandera nos ayuda a saber si el resultado es cero

    mov ebx, 1         ; guardamos el numero 1 en EBX
    cmp ebx, 1         ; comparamos EBX con 1, como son iguales ZF se activa
    call DumpRegs      ; mostramos los registros y las banderas

    mov eax, 01h       ; guardamos el valor hexadecimal 01 en EAX
    cmp eax, ebx       ; comparamos EAX con EBX, los dos valen 1
    call DumpRegs      ; revisamos que ZF este activada

    mov cl, 11111111b ; guardamos un numero binario en cl
    cmp cl, cl         ; comparamos cl consigo mismo, por eso son iguales
    call DumpRegs      ; mostramos los resultados


    ; CONDICION 2: Sign FLAG (SF) nos indica si el resultado tiene signo negativo

    mov eax, 0         ; limpiamos eax
    mov ebx, 0         ; limpiamos ebx

    mov al, -5         ; guardamos -5 en AL
    mov bl, 1          ; guardamos 1 en bl

    cmp al, bl         ; comparamos -5 con 1 el resultado seria negativo
    call DumpRegs      ; revisamos la bandera SF


    ; CONDICION 3: Carry FLAG (CF) se activa cuando hay un acarreo fuera del tamaño del registro

    mov eax, 0         ; limpiamos EAX
    mov ebx, 0         ; limpiamos EBX

    mov al, 255        ; guardamos 255 que es el maximo sin signo en 8 bits
    add al, 1          ; le sumamos 1 y se produce un acarreo

    call DumpRegs      ; revisamos que CF se haya activado


    ; CONDICION 4: OverFlow FLAG (OF) indica si un resultado con signo se sale del rango permitido

    mov eax, 0         ; limpiamos eax
    mov ebx, 0         ; limpiamos ebx

    mov al, -128       ; guardamos el valor minimo con signo de 8 bits
    mov bl, 1          ; guardamos 1 en bl

    cmp al, bl         ; La comparacion equivale a -128 - 1 ya que el resultado no cabe en 8 bits con signo

    call DumpRegs      ; revisamos que OF se haya activado

    ; CONDICION 5: TEST compara los bits usando AND pero sin guardar el resultado

    mov eax, 0         ; limpiamos EAX
    mov eax, 5         ; guardamos 5 que en binario es 00000101

    test eax, 1        ; Revisamos si el ultimo bit es 1 y como 5 es impar ese bit esta encendido

    call DumpRegs      ; revisamos las banderas despues del TEST

    mov eax, 0         ; limpiamos eax
    mov al, 10000000b  ; se guarda el numero binario en AL

    test al, al        ; comprobamos los bits de al consigo mismo
    call DumpRegs      ; Mostramos el estado de las banderas

    exit               ; Finalizamos el programa

main ENDP
END main
