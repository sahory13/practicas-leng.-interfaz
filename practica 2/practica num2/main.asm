; Materia: lenguajes de interfaz
;Aumno: Estrada Trejo Sahory
; Horario: 8:00-9:00
;Docente: Dr. José Luis Medina Jiménez
;practica 2: captura y desplegado de mensajes
;descripcion: este programa pide que ingreses un nombre y luego lo despliega en pantalla


INCLUDE Irvine32.inc   

.data

    mensaje BYTE "Escribe tu nombre: ", 0     ; aqui ya guardamos el mensaje que queremos que aparezca en pantalla y el 0 indica donde termina el texto
  
    nombre BYTE 15 DUP(0)  ; aqui reservamos los espacios de memoria (15) para guardar el nombre e indicamos que los espacios empiezan con valor 0

.code
main PROC

    mov edx, OFFSET mensaje  ; guardamos en edx la dreccion donde esta nuestro mensaje 

    call WriteString  ; mostramos el mesnaje para pedir el nomnbre

    mov edx, OFFSET nombre  ; indicamos donde se guardara en nombre que ingresemos/escribamos
 
    mov ecx, SIZEOF nombre - 1   ; indicamos el numero maximo de caracteres que podemos leer
   
    call ReadString  ; leemos el nombre que ingresamos
  
    call CrLf   ; hacemos un salto de linea para que el nombre se muestre en la siguiente linea

    mov edx, OFFSET nombre   ; indicamos donde se encuentra el nombre que ingresamos para mostrarlo en pantalla
    
    call WriteString  ; mostramos el nombre que ingresamos en pantalla
   
    call CrLf  ; hacemos un salto de linea para que el programa termine en la siguiente linea
 

    exit
    

main ENDP
END main
 