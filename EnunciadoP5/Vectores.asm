######################################################################
## Fichero: Vectores.asm
## Descripci�n: Programa que guarda en un Array C el resultado de A+4B
## Fecha �ltima modificaci�n: 2017-03-15
## Autores: Javier Delgado del Cerro (2017), Javier L�pez Cano (2017) 
## Pareja: 4
## Asignatura: E.C. 1� grado
## Grupo de Pr�cticas: 2101
## Grupo de Teor�a: 210
## Pr�ctica: 4
## Ejercicio: 1
######################################################################

#############################
# Equivalente en C
# if (a < b) 
#	c = b;
# else
#	c = a;
# while (1);
#############################

.text 	
main:	
	add $s0, $zero, $zero   #Inicializamos la vriable i a 0
	lw $t0, N 				#Cargar en registro $t0 la variable N
	add $t0, $t0, $t0 		#Multiplicamos N por 2 sumandolo a si mismo 
	add $t0, $t0, $t0		#Multiplicamos de nuevo por 2 para poder compararlo con i, que aumenta de 4 en 4
loop: 	
	slt $t1, $s0, $t0  		#$t1 ser� 1 si i<N
	beq $t1, $zero, fin 	#Si $t5 es 0, entonces no se cumple i<N, finalizamos el bucle
	lw $t2, A($s0)			#Cargamos A[i] en $t2
	lw $t3, B($s0)			#Cargamos B[i] en $t3
	add $t3, $t3, $t3 		#Multiplicamos B[i] por 2 sumandolo a si mismo
	add $t3, $t3, $t3 		#Multiplicamos B[i] de nuevo por 2 para que sea m�ltiplo de 4
	add $t4, $t2, $t3		#Sumamos A[i]+4*B[i]
	sw $t4, C($s0)			#Escribimos el resultado en C[i]
	addi $s0, $s0, 4 		#Sumamos de 4 en 4 para que corresponda a la siguiente posicion del array.
	j loop 					#Salto al principio del bucle de nuevo
fin: j fin
	
	
.data  				#Comienzo de seccion de datos de usuario
.align 2 			#Direccion alineada a palabra (multiplo de 2^2=4), no hace falta salvo que metamos a mano en .data una direcci�n que no sea m�ltiplo de 4
N: 6				#Variable N, n�mero de datos del array
A: 2, 4, 6, 8, 10, 12 		 #Array A
B: -1, -5, 4, 10, 1, -5		 #Array B
C: .space 24  			#Array C, reservamos espacio
									


