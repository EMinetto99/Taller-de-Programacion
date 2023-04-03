program finalTaller;
type
	cadena30 = string[30];

	alumno = record
		nom: cadena30;
		dni: integer;
		puntaje: real;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
		end;

	lista = ^nodoL;
	nodoL = record
		dato: alumno;
		sig: lista;
		end;
procedure leerAlumno(var a: alumno);
	begin
		write('DNI de alumno: ');
		readln(a.dni);
		if (a.dni <> 0) then begin
			write('Nombre del alumno: ');
			readln(a.nom);
			a.puntaje := (random(1000)+1)/10;
			writeln('Puntaje de fotografia: ',a.puntaje:5:1);
			end;
		writeln;
	end;
procedure agregarArbol(var a: arbol; alu: alumno);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato := alu;
			a^.HI := nil;
			a^.HD := nil;
			end
			else
				if (alu.puntaje < a^.dato.puntaje) then
					agregarArbol(a^.HI, alu)
					else
						agregarArbol(a^.HD, alu);
	end;
procedure crearLista(a: arbol; var l: lista; valorINF, valorSUP: real);
	procedure agregarListaOrdenado(var l: lista; a: alumno);
		var
			ant, act, aux: lista;
		begin
			new(aux);
			aux^.dato := a;
			ant := L;
			act := L;
			while (act <> nil) and (act^.dato.puntaje < a.puntaje) do begin
				ant := act;
				act := act^.sig;
				end;
			if (act = ant) then
				L := aux
				else
					ant^.sig := aux;
			aux^.sig := act;
		end;
	begin
		if (a <> nil) then
			if (a^.dato.puntaje > valorINF) and (a^.dato.puntaje < valorSUP) then begin
				crearLista(a^.HI, l, valorINF, valorSUP);
				writeln(a^.dato.puntaje:5:1);
				agregarListaOrdenado(l, a^.dato);
				crearLista(a^.HD, l, valorINF, valorSUP);
				end
				else begin
					if (a^.dato.puntaje > valorINF) then
						crearLista(a^.HI, l, valorSUP, valorINF)
						else
							if (a^.dato.puntaje < valorSUP) then
								crearLista(a^.HD, l, valorINF, valorSUP);
					end;
	end;
procedure imprimirLista(l: lista);
	begin
		write('L --->');
		while (l <> nil) do begin
			write('|Puntaje: ',l^.dato.puntaje:5:1,' / DNI: ',l^.dato.dni,' |---> ');
			l := l^.sig;
			end;
		writeln('nil');
		end;
function dniMasChico(a: arbol): real;
	procedure buscarMenorDNI(a: arbol; var min: integer; var pnt: real);
		begin
			if (a <> nil) then begin
				buscarMenorDNI(a^.HI, min, pnt);
				if (a^.dato.dni < min) then begin
					min := a^.dato.dni;
					pnt := a^.dato.puntaje;
					end;
				buscarMenorDNI(a^.HD, min, pnt);
				end;
			end;
	var
		min: integer;
		pnt: real;
	begin
		min := 9999;
		buscarMenorDNI(a, min, pnt);
		dniMasChico := pnt;
		end;
var
	a: arbol;
	l: lista;
	alu: alumno;
	num1, num2: real;
begin
	Randomize;
	a := nil;
	l := nil;
	leerAlumno(alu);
	while (alu.dni <> 0) do begin
		agregarArbol(a, alu);
		leerAlumno(alu);
		end;
	write('PRIMER puntaje (0-100) a buscar entre numeros: ');
	readln(num1);
	write('SEGUNDO puntaje (0-100) a buscar entre numeros: ');
	readln(num2);
	crearLista(a, l, num1, num2);
	writeln;
	imprimirLista(l);
	writeln;
	writeln('Puntaje del alumno con DNI mas chico: ',dniMasChico(a):5:1);
	readln;
end.