program MinettoMellaEmiliano;
const
	cantEstilos = 15;
type
	rangoEstilo = 1..cantEstilos;
	cadena30 = string[30];

	banda = record
		nombre: cadena30;
		estilo: rangoEstilo;
		integrantes: integer;
		end;
	lista = ^nodo;
	nodo = record
		dato: banda;
		sig: lista;
		end;

	vec_estilos = array [1..cantEstilos] of lista;
procedure inicializarVector(var v: vec_estilos);
	var
		i: integer;
	begin
		for i := 1 to cantEstilos do
			v[i] := nil;
		end;
procedure leerBanda(var b: banda);
	begin
		write('Cantidad de integrantes (0 para terminar): ');
		readln(b.integrantes);
		if (b.integrantes <> 0) then begin
			write('Nombre de la banda: ');
			readln(b.nombre);
			write('Estilo de la banda (1 a ',cantEstilos,'): ');
			readln(b.estilo);
			end;
		writeln;
		end;
procedure almacenar(var v: vec_estilos; b: banda);
	procedure agregarListaOrdenada(var L: lista; b: banda);
		var
			aux, ant, act: lista;
		begin
			new(aux);
			aux^.dato := b;
			act := L;
			ant := L;
			while (act <> nil) and (act^.dato.nombre < b.nombre) do begin
				ant := act;
				act := act^.sig;
				end;
			if (act = ant) then
				L := aux
				else
					ant^.sig := aux;
			aux^.sig := act;
		end;
	var
		index: integer;
	begin
		index := b.estilo;
		agregarListaOrdenada(v[index], b);
		end;
procedure imprimirVector_Listas(v: vec_estilos);
	procedure imprimirLista(L: lista);
		begin
			write('L --->');
			while (L <> nil) do begin
				write('|',L^.dato.nombre,'|--->');
				L := L^.sig;
				end;
			writeln(' NIL');
			end;
	var
		i: integer;
	begin
		for i := 1 to cantEstilos do begin
			write('[',i,'] ');
			imprimirLista(v[i]);
			end;
		writeln;
		end;
procedure agregarAdelante(var l: lista; b: banda);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato := b;
		aux^.sig := L;
		L := aux;
		end;
procedure merge(v: vec_estilos; var l: lista);
	procedure minimo(var v: vec_estilos; var min: banda);
		var
			i, pos: integer;
		begin
			min.nombre := 'ZZZZ';
			pos := -1;
			for i := 1 to cantEstilos do
				if (v[i] <> nil) and (v[i]^.dato.nombre <= min.nombre) then begin
					pos := i;
					min := v[i]^.dato;
					end;
			if (pos <> -1) then
				v[pos] := v[pos]^.sig;
			end;
	var
		min: banda;
	begin
		l := nil;
		minimo(v, min);
		while (min.nombre <> 'ZZZZ') do begin
			agregarAdelante(l, min);			// Como estan ordenadas en orden ascendente, agrego atras para que sea en orden inverso (mayor a menor)
			minimo(v, min);
			end;
		end;
procedure imprimirLista(L: lista);
	begin
		write('L --->');
		while (L <> nil) do begin
			write('|',L^.dato.nombre,'|--->');
			L:= L^.sig;
			end;
		writeln(' NIL');
		end;
procedure crearListaSolistas(lb: lista; var ls: lista);
	begin
		if (lb <> nil) then begin
			if (lb^.dato.estilo = 1) then
				agregarAdelante(ls, lb^.dato);	// Si el estilo es solista, agrego a una lista ordenada ascendente
			crearListaSolistas(lb^.sig, ls);
			end;
		end;
var
	v: vec_estilos;
	lb, ls: lista;			// Lista de "bandas" y bandas "solistas"
	b: banda;
begin
	lb := nil;
	inicializarVector(v);
	leerBanda(b);
	while (b.integrantes <> 0) do begin
		almacenar(v, b);
		leerBanda(b);
		end;
	imprimirVector_Listas(v);
	writeln;
	merge(v, lb);
	imprimirLista(lb);
	writeln;
	crearListaSolistas(lb, ls);
	imprimirLista(ls);
	readln();
end.