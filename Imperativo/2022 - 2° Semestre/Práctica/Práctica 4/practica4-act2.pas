program peliculas;
const
	cantGeneros = 8;
type
	generos = 1..cantGeneros;
	pelicula = record
		codigo: integer;
		genero: generos;
		puntaje: real;
		end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
		end;
	vec_peliculas = array[1..cantGeneros] of lista;

procedure inicializarVector(var v: vec_peliculas);
	var
		i: integer;
	begin
		for i := 1 to cantGeneros do
			v[i] := nil;
		end;
procedure leerPelicula(var p: pelicula);
	begin
		write('Ingrese un codigo de pelicula: ');
		readln(p.codigo);
		if (p.codigo <> -1) then begin
			write('Ingrese genero: ');
			readln(p.genero);
			p.puntaje := (random(100)+1)/10;
			writeln('Ingrese el puntaje de critica: ',p.puntaje:3:1);
			end;
		writeln;
		end;
procedure almacenar(var v: vec_peliculas; p: pelicula);
	procedure agregarListaOrdenado(var L: lista; p: pelicula);
	var
		aux, act, ant: lista;
	begin
		new(aux);			// Creo nuevo elemento, asigno el dato de entrada.
		aux^.dato := p;
		aux^.sig := nil;
		if (L = nil) then	// Si L es nil, la lista está vacia y lo asigno como primero.
			L := aux
			else begin		// Sino actualizo los punteros al primer elemento para iniciar el recorrido en la lista.
				act := L;
				ant := L;
				while (act <> nil) and (act^.dato.codigo < aux^.dato.codigo) do begin	// Condicion si el elemento debe ser MENOR o MAYOR (descendente/ascendente)
					ant := act;				// Recorrido mientras "act" sea menor al elemento nuevo
					act := act^.sig;		// y no se termine la lista.
					end;
				if (act = L) then begin		// Si "act" apunta al primer elemento, significa que
					aux^.sig := L;			// el nuevo elemento era menor al primero de la lista; entonces se hubicará
					L := aux;				// en el primer lugar de la lista (apuntará al primero).
					end
					else begin
						ant^.sig := aux;	// sino el nuevo es mayor al primero, por lo que puede que vaya al
						aux^.sig := act;	// final de la lista o en el medio.
						end;
				end;
		end;
	var
		index: integer;
	begin
		index := p.genero;
		agregarListaOrdenado(v[index], p);
		end;
procedure generarLista(v: vec_peliculas; var nueL: lista);
	procedure minimo(var v: vec_peliculas; var min: pelicula);
		var
			i, pos: integer;
		begin
			min.codigo := 9999;		// "ZZZZ" / "9999" - valor muy alto para encontrar el minimo posible
			pos := -1;			// Flag por si no encontré
			for i := 1 to cantGeneros do	{ Recorro el vector de listas }
				{ Si la lista no esta vacia y Si encuentro un dato menor o igual al minimo, actualizo el minimo}
				if (v[i] <> nil) and (v[i]^.dato.codigo <= min.codigo) then begin
					pos := i;							// Guardo el indice actual
					min := v[i]^.dato;		// Actualizo el minimo actual
					end;
			if (pos <> -1) then	{Si encontré un minimo}
				v[pos] := v[pos]^.sig;				// Paso al siguiente elemento de la lista
			end;
	procedure agregarAtras(var L: lista; m: pelicula; var ult: lista);
		var
    		aux: lista;
  		begin
    		new(aux);
    		aux^.dato:= m;
    		aux^.sig:= nil;
    		if (L <> nil) then
        		ult^.sig:= aux
    			else
        			L:= aux;
    		ult:= aux;
			end;
	var
		min: pelicula;
		ult: lista;
	begin
		nueL := nil;
		minimo(v, min);						// Busco un dato minimo entre las dos listas
		while (min.codigo <> 9999) do begin		// Si encontré un minimo
			agregarAtras(nueL, min, ult);	// Agrego el nuevo dato minimo a la estructura de datos
			minimo(v, min);					// Vuelvo a buscar un nuevo dato minimo entre las listas
			end;
		end;
procedure imprimirLista(L: lista);
	begin
		write('L --->');
		while (L <> nil) do begin
			write('|',L^.dato.codigo,'|--->');
			L := L^.sig;
			end;
		writeln(' NIL');
		end;
procedure imprimirVectorListas(v: vec_peliculas);
	var
		i: integer;
	begin
		for i := 1 to cantGeneros do begin
			write('[',i,'] ');
			imprimirLista(v[i]);
			end;
		writeln;
		end;
var
	v: vec_peliculas;
	p: pelicula;
	l: lista;
begin
	Randomize;
	inicializarVector(v);
	leerPelicula(p);
	while (p.codigo <> -1) do begin
		almacenar(v, p);
		leerPelicula(p);
		end;
	imprimirVectorListas(v);
	generarLista(v, l);
	imprimirLista(l);
	readln;
end.