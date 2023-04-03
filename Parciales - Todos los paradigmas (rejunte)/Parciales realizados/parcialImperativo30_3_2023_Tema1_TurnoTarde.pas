program parcialImperativo30_3_2023_Tema1_TTarde;
type
	cadena30 = string[30];

	banda = record
		nombre: cadena30;
		estilo: cadena30;
		integrantes: integer;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: banda;
		HI: arbol;
		HD: arbol;
		end;

	lista = ^nodo;
	nodo = record
		dato: banda;
		sig: lista;
		end;
procedure leerBanda(var b: banda);
	begin
		write('Cantidad de integrantes de la banda: ');
		readln(b.integrantes);
		if (b.integrantes > 0) then begin
			write('Nombre de la banda: ');
			readln(b.nombre);
			write('Estilo: ');
			readln(b.estilo);
			end;
		writeln;
		end;
procedure almacenarArbol(var a: arbol; b: banda);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato := b;
			a^.HI := nil;
			a^.HD := nil;
			end
			else
				if (b.nombre < a^.dato.nombre) then
					almacenarArbol(a^.HI, b)
					else
						almacenarArbol(a^.HD, b);
		end;
procedure agregarOrdenado(var L: lista; b: banda);
	var
		aux, act, ant: lista;
	begin
		new(aux);
		aux^.dato := b;
		act := L;
		ant := L;
		while (act <> nil) and (act^.dato.estilo < b.estilo) do begin
			ant := act;
			act := act^.sig;
			end;
		if (act = ant) then
			L := aux
			else
				ant^.sig := aux;
		aux^.sig := act;
		end;
procedure listarSolistas(a: arbol; var l: lista);
	begin
		if (a <> nil) then begin
			if (a^.dato.integrantes = 1) then
				agregarOrdenado(l, a^.dato);
			listarSolistas(a^.HI, l);
			listarSolistas(a^.HD, l);
			end;
		end;
procedure imprimirLista(L: lista);
	begin
		write('L --->');
		while (L <> nil) do begin
			write('|Estilo: ',L^.dato.estilo,' / Nombre: ',L^.dato.nombre,'|--->');
			L:= L^.sig;
			end;
		writeln(' NIL');
		end;
function bandaMasIntegrantes(a: arbol): cadena30;
	procedure masIntegrantes(a: arbol; var nom: cadena30; var cant: integer);
		begin
			if (a <> nil) then begin
				masIntegrantes(a^.HI, nom, cant);
				if (a^.dato.integrantes > cant) then begin
					nom := a^.dato.nombre;
					cant := a^.dato.integrantes;
					end;
				masIntegrantes(a^.HD, nom, cant);
				end;
			end;
	var
		nom: cadena30;
		cant: integer;
	begin
		cant := -9999;
		masIntegrantes(a, nom, cant);
		bandaMasIntegrantes := nom;
		end;
var
	a: arbol;
	l: lista;
	b: banda;
begin
	a := nil;
	l := nil;
	leerBanda(b);
	while (b.integrantes > 0) do  begin
		almacenarArbol(a, b);
		leerBanda(b);
		end;
	listarSolistas(a, l);
	writeln;
	imprimirLista(l);
	writeln;
	writeln('Nombre de la banda con mas integrantes: ',bandaMasIntegrantes(a));
	readln;
end.