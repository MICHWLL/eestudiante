Algoritmo calcularNotas
	//variables principales
	definir eleccion, cuenteEstudiantes como entero
	//inicializando variables
	eleccion <- 0
	cuenteEstudiantes <- 0
	//lista de estudiantesA
	Dimension estudiantes[10,2]
	//nota de estudiantes
	Dimension notas[10,4]
	
	Dimension imprimible[10,8]
	
	
	repetir
		//menu principal 
		
		Escribir "*************** Menu ****************"
		escribir "1. estudiantes registrados"
		escribir "2. crear estudiantes"
		escribir "3. asignar notas estudiantes, inasistencias y nota final"
		escribir "4. salir"
		
		
		Leer eleccion
		Segun eleccion Hacer
			1 :
				ImpresionArreglos(estudiantes, 10,2,"estudiantes ", " codigo   nombre")
			2:
				CrearEstudiante(estudiantes,cuenteEstudiantes)
			3:
				asignacionDeNotas(imprimible,notas,estudiantes,cuenteEstudiantes)
			4:
				escribir "gracias"
			De Otro Modo:
				escribir "opcion no valida"
		Fin Segun
		Escribir "Presione enter para continuar"
		Esperar Tecla
		Borrar Pantalla
	Hasta Que  eleccion=6
	
FinAlgoritmo

//Crea un estudiante (Ulitiza la variable global)
Funcion CrearEstudiante (estudiantes Por Referencia,  cuenteEstudiantes Por Referencia)
	Si cuenteEstudiantes<10 Entonces
		cuenteEstudiantes <- cuenteEstudiantes  + 1
		Para i<-1 Hasta 2 Con Paso 1 Hacer
			Segun i Hacer
				1:
					Escribir "Ingrese el código del alumno:"
				2:
					Escribir "Ingrese el nombre del alumno:"
					
			Fin Segun
			Leer estudiantes[cuenteEstudiantes,i]
		Fin Para
		ImpresionArreglos(estudiantes, cuenteEstudiantes, 2, "estudiantes:", "codigo  Nombre ")
		Escribir "estudiante registrado con exito!"
	SiNo
		Escribir "No es posible crear más estudiantes, llego al limite"
	Fin Si
FinFuncion


Funcion asignacionDeNotas (imprimible por referencia, notas Por Referencia, estudiantes, cuenteEstudiantes)
	Definir salir, codEstudiante como cadena
	Definir nota1,nota2, nota3, notaFinal como real 
	Definir contador, inasistencia como entero
	Definir nombre, codigo  como cadena
	
	
	contador <- 1
	
	Repetir
		
		Escribir "Ingrese el código del estudiante:"
		Leer codEstudiante
		
		Escribir "Ingrese nota 1 del estudiante:"
		Leer nota1
		
		Escribir "Ingrese nota 2 del estudiante:"
		Leer nota2
		
		Escribir "Ingrese nota 3 del estudiante:"
		Leer nota3
		
		Escribir "Ingrese inasistencias del estudiante:"
		Leer inasistencia
		si inasistencia>0 entonces
			Si  inasistencia<10 Entonces
				sumaTotalInasistencia<-0
			Fin Si
			Si inasistencia >10 y inasistencia<15 Entonces
				sumaTotalInasistencia <- 0.15
			Fin Si
			Si inasistencia >15 Entonces
				sumaTotalInasistencia <- 1
			Fin Si
		Fin si 
		i <- 0
		
		Repetir
			i <- i + 1
			Si estudiantes[i,1]=codEstudiante Entonces
				codEstudiante<-estudiantes[i,1]
				nombre <- estudiantes[i,2]
				promedio <- (nota1+nota2+nota3) /3
				escribir promedio
			Fin si	
		Hasta Que estudiantes[i,1]=codEstudiante O i > cuenteEstudiantes
		
		imprimible[contador,1] <- codEstudiante
		imprimible[contador,2] <- nombre
		imprimible[contador,3] <- ConvertirATexto(nota1)
		imprimible[contador,4] <- ConvertirATexto(nota2)
		imprimible[contador,5] <- ConvertirATexto(nota3)
		imprimible[contador,6] <- ConvertirATexto(inasistencia)
		imprimible[contador,7]<- ConvertirATexto(promedio -sumaTotalInasistencia)
		
		
		contador <- contador + 1
		
		Escribir "Desea salir? si/no"
		Leer salir
		
	Hasta Que salir="si"
	
	ImpresionArreglos(imprimible,contador -1 , 8,"el estudiantado", "COD  NOMBRE  P1 P2 P3 INASISTENCIAS NOTA FINAL ")

FinFuncion


//Imprime los usuarios que estan activos en el sistema (Ulitiza la variable global)
Funcion ImpresionArreglos (Arreglo Por Referencia, TamañoFila, TamañoColum, Titulo, Encabezado)
	Escribir titulo
	Escribir Encabezado
	Para i<-1 Hasta TamañoFila Con Paso 1 Hacer
		Para j<-1 Hasta TamañoColum Con Paso 1 Hacer
			Escribir Sin bajar Arreglo[i,j], " " 
		Fin Para
		Escribir ""
	Fin Para
FinFuncion
