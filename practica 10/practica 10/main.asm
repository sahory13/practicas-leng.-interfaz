; Materia: Lenguajes de Interfaz
; Alumno: Estrada trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 10  cadena con decimal
; Descripción: calculamos los bytes descargados los bytes pendientes el porcentaje de avance y los grupos completos de una descarga




INCLUDE Irvine32.inc

.data
    ; datos de la descarga

    bloquesRecibidos DWORD 125
    tamanoBloque DWORD 512
    tamanoTotal DWORD 100000

    ; variables donde guardamos los resultados

    bytesDescargados DWORD ?
    bytesPendientes DWORD ?
    porcentajeAvance DWORD ?
    gruposCompletos DWORD ?
    residuoGrupos DWORD ?

    buffer BYTE 11 DUP(0)  ; espacio para guardar el numero convertido a texto


    ; mensajes
    msgDescargados BYTE "Bytes descargados: ", 0
    msgPendientes BYTE "Bytes pendientes: ", 0
    msgPorcentaje BYTE "Porcentaje entero de avance: ", 0
    msgGruposCompletos BYTE "Grupos completos: ", 0
    msgResiduo BYTE "Residuo del agrupamiento: ", 0

.code
main PROC

    ; calculamos los bytes que ya se descargaron
    mov eax, bloquesRecibidos
    mov ebx, tamanoBloque
    mul ebx
    mov bytesDescargados, eax


    ; restamos los bytes descargados al tamaño total
    mov eax, tamanoTotal
    sub eax, bytesDescargados
    mov bytesPendientes, eax


    ; calculamos el porcentaje de avance
    mov eax, bytesDescargados
    mov ebx, 100
    mul ebx
    mov ebx, tamanoTotal
    mov edx, 0
    div ebx
    mov porcentajeAvance, eax


    ; dividimos los bytes descargados en grupos de 1024
    mov eax, bytesDescargados
    mov edx, 0
    mov ebx, 1024
    div ebx
    mov gruposCompletos, eax
    mov residuoGrupos, edx  ; guardamos los bytes que sobraron


    ; mostramos los bytes descargados
    mov edx, OFFSET msgDescargados
    call WriteString
    mov eax, bytesDescargados
    mov esi, OFFSET buffer
    call convertirDecimal  ; convertimos el numero para mostrarlo como texto
    mov edx, OFFSET buffer
    call WriteString
    call Crlf


    ; mostramos los bytes pendientes
    mov edx, OFFSET msgPendientes
    call WriteString
    mov eax, bytesPendientes
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf



    ; mostramos el porcentaje de avance
    mov edx, OFFSET msgPorcentaje
    call WriteString
    mov eax, porcentajeAvance
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString


    mov al, '%'
    call WriteChar       ; agregamos el simbolo de porcentaje
    call Crlf



    ; mostramos los grupos completos
    mov edx, OFFSET msgGruposCompletos
    call WriteString
    mov eax, gruposCompletos
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf



    ; mostramos el residuo del agrupamiento
    mov edx, OFFSET msgResiduo
    call WriteString
    mov eax, residuoGrupos
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf


    exit

main ENDP


convertirDecimal PROC



    ; guardamos los registros para no perder sus valores
    push eax
    push ebx
    push ecx
    push edx
    push esi

    mov ebx, 10
    mov ecx, 0



    ; revisamos si el numero que queremos convertir es cero
    cmp eax, 0
    jne cicloDividir

    mov BYTE PTR [esi], '0'
    mov BYTE PTR [esi + 1], 0
    jmp finConvertir

cicloDividir:
    mov edx, 0

    div ebx             ; dividimos entre 10 para obtener cada digito

    add dl, '0'         ; convertimos el residuo a un caracter

    push edx            ; guardamos el digito en la pila
    inc ecx
    cmp eax, 0
    jne cicloDividir

cicloExtraer:
    pop edx             ; sacamos los digitos en el orden correcto

    mov [esi], dl

    inc esi             ; avanzamos a la siguiente posicion del buffer

    loop cicloExtraer

    mov BYTE PTR [esi], 0  ; marcamos donde termina el texto

finConvertir:
    ; recuperamos los registros que guardamos al principio

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

convertirDecimal ENDP

END main
