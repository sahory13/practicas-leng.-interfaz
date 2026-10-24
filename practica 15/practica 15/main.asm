; Materia: Lenguajes de Interfaz
; Alumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 15 manipulacion de archivo
; Descripción: Creamos un archivo de texto llamado inventario.txt escribimos un numero dentro de el y verificamos que se haya guardado correctamente





INCLUDE Irvine32.inc

.data
    nombreArchivo BYTE "inventario.txt", 0
    texto BYTE "125", 0

    archivoHandle DWORD ? ; aqui guardamos la referencia del archivo

    mensajeExitoso BYTE "Archivo creado y escrito correctamente.", 0
    mensajeError BYTE "Error al crear o escribir en el archivo.", 0

.code
main PROC

    ; 1. crear archivo

    mov edx, OFFSET nombreArchivo
    call CreateOutputFile    ; creamos el archivo inventario.txt

    cmp eax, INVALID_HANDLE_VALUE
    je error   ; si no se pudo crear, mostramos error

    mov archivoHandle, eax      ; guardamos el identificador del archivo


    ; 2. escribir texto

    mov eax, archivoHandle
    mov edx, OFFSET texto

    mov ecx, SIZEOF texto - 1  ; indicamos cuantos caracteres vamos a escribir

    call WriteToFile     ;escribimos el numero 125 dentro del archivo


    jc errorEscritura       ; si hubo un error al escribir, saltamos

    cmp eax, SIZEOF texto - 1

    jne errorEscritura    ; revisamos que se hayan escrito los 3 caracteres


    ; 3. cerrar archivo

    mov eax, archivoHandle

    call CloseFile     ; cerramos el archivo despues de escribir

    test eax, eax

    jz error    ; revisamos si hubo algun problema al cerrarlo

    mov edx, OFFSET mensajeExitoso
    call WriteString
    jmp fin


errorEscritura:    ; si hubo un error al escribir, intentamos cerrar el archivo
    mov eax, archivoHandle
    call CloseFile

error:
    mov edx, OFFSET mensajeError
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main

