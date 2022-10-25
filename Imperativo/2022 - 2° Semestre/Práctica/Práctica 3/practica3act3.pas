program practica3act3;
type
	infoAlu= record
		leg: integer;
		dni: integer;
		anio: integer;
		end;
	arbol = ^nodoA;
	nodoA = record
		dato: infoAlu;
		HI: arbol;
		HD: arbol;
		end;
procedure imprimirArbol(a: arbol);
	begin
    	if (a <> nil) then begin
        	imprimirArbol(a^.HI);
        	write (' |Leg ',a^.dato.leg,'|');
        	write ('Anio: ',a^.dato.anio,'| ');
        	imprimirArbol(a^.HD);
        	end;
        end;
procedure imprimirArbol_MenorQue(a: arbol; num: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.leg < num) then begin
				imprimirArbol_MenorQue(a^.HI, num);
				write('|Leg: ',a^.dato.leg,' ');
				write('DNI: ',a^.dato.dni,' ');
				write('Anio: ',a^.dato.anio,'| ');
				imprimirArbol_MenorQue(a^.HD, num);
				end
				else
					if (a^.dato.leg >= num) then
						imprimirArbol_MenorQue(a^.HI, num);
			end;
		end;
procedure imprimirArbol_EntreValores(a: arbol; nInferior, nSuperior: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.leg > nInferior) then
				imprimirArbol_EntreValores(a^.HI, nInferior, nSuperior);
			if (a^.dato.leg > nInferior) and (a^.dato.leg < nSuperior) then begin
				write('|Leg: ',a^.dato.leg,' ');
				write('DNI: ',a^.dato.dni,' ');
				write('Anio: ',a^.dato.anio,'| ');
				end;
			if (a^.dato.leg < nSuperior) then
				imprimirArbol_EntreValores(a^.HD, nInferior, nSuperior);
			end;
		end;
function maximoDNI(a: arbol): integer;
	procedure buscarMaximo_SinOrden(a: arbol; var max: integer);
		begin
			if (a <> nil) then begin
				buscarMaximo_SinOrden(a^.HI, max);
				if (a^.dato.dni > max) then
					max := a^.dato.dni;
				buscarMaximo_SinOrden(a^.HD, max);
				end;
			end;
	var
		max: integer;
	begin
		max:= -9999;
		buscarMaximo_SinOrden(a, max);
		maximoDNI:= max;
		end;
function cantImpares(a: arbol): integer;
	procedure workImpares(a: arbol; var impares: integer);
		begin
			if (a <> nil) then begin
				workImpares(a^.HI, impares);
				if ((a^.dato.leg mod 2) = 1) then
					impares := impares + 1;
				workImpares(a^.HD, impares);
				end;
			end;
	var
		cantImp: integer;
	begin
		cantImp := 0;
		workImpares(a, cantImp);
		cantImpares := cantImp;
		end;

procedure procesarAlumnos(var a: arbol);
	procedure leerAlumno(var info: infoAlu);
		begin
			write('Ingrese el LEGAJO del alumno (0 para terminar): ');
			readln(info.leg);
			if (info.leg <> 0) then begin
				write('Ingrese el DNI del alumno: ');
				readln(info.dni);
				write('Ingrese el ANIO de ingreso: ');
				readln(info.anio);
				end;
			end;
	procedure cargarArbol(var a: arbol; i: infoAlu);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato:= i;
				a^.HI:= nil;
				a^.HD:= nil;
				end
				else begin
					if (i.leg < a^.dato.leg) then
						cargarArbol(a^.HI, i)
						else
							cargarArbol(a^.HD, i); // Permite ingresar datos repetidos
					end;
			end;
	var
		info: infoAlu;
	begin
		writeln('======= SISTEMA DE ALUMNOS DE TALLER DE PROGRAMACION =======');
		leerAlumno(info);
		while (info.leg <> 0) do begin
			if (info.anio > 2010) then
				cargarArbol(a, info);
			writeln;
			leerAlumno(info);
			end;
		imprimirArbol(a);
		writeln;
		end;
var
	a: arbol;
	num, num_2: integer;
begin
	a:=nil;
	procesarAlumnos(a);
	write('Ingrese un LEGAJO para imprimir los menores que este: ');
	readln(num);
	imprimirArbol_MenorQue(a, num);
	writeln;
	writeln('== Ingrese un rango de valores a buscar en el arbol ==');
	write('Valor INFERIOR: ');
	readln(num);
	write('Valor SUPERIOR: ');
	readln(num_2);
	imprimirArbol_EntreValores(a, num, num_2);
	writeln;
	writeln('Numero de DNI mas grande: ',maximoDNI(a));
	writeln('Cantidas de LEGAJOS impares: ',cantImpares(a));
	readln;
end.