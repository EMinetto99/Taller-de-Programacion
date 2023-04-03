program practica5act4;
const
	dias = 7;
type
	rangoDias = 1..dias;

	entrada = record
		dia: rangoDias;
		codigo: integer;
		asiento: integer;
		monto: real;
		end;

	regTotal = record
		codigo: integer;
		cantTotal: integer;
		end;

	listaT = ^nodoT;
	nodoT = record
		dato: regTotal;
		sig: listaT;
		end;

	listaE = ^nodoE;
	nodoE = record
		dato: entrada;
		sig: listaE;
		end;

	vec_entradas = array[1..dias] of listaE;
procedure inicializarVector(var v: vec_entradas);
	var
		i: integer;
	begin
		for i := 1 to dias do
			v[i] := nil;
		end;
procedure leerEntrada(var e: entrada);
	begin
		write('Codigo de entrada (0 para terminar): ');
		readln(e.codigo);
		if (e.codigo <> 0) then begin
			write('Dia de la funcion (1 a ',dias,'): ');
			readln(e.dia);
			e.asiento := random(500)+1;
			writeln('Asiento: ',e.asiento);
			e.monto := random(2000)+1;
			writeln('Monto: ',e.monto:5:2);
			writeln;
			end;
		end;
procedure almacenar(var v: vec_entradas; e: entrada);
	procedure agregarOrdenado(var L: listaE; e: entrada);
		var
			aux, ant, act: listaE;
		begin
			new(aux);
			aux^.dato := e;
			act := L;
			ant := L;
			while (act <> nil) and (act^.dato.codigo < e.codigo) do begin
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
		index := e.dia;
		agregarOrdenado(v[index], e);
		end;
procedure imprimirVector_Listas(v: vec_entradas);
	procedure imprimirLista(L: listaE);
		begin
			write('L --->');
			while (L <> nil) do begin
				write('|Codigo: ',L^.dato.codigo,' / Monto: ',L^.dato.monto:5:2,'|--->');
				L := L^.sig;
				end;
			writeln(' NIL');
			end;
	var
		i: integer;
	begin
		for i := 1 to dias do begin
			write('[',i,'] ');
			imprimirLista(v[i]);
			end;
		writeln;
		end;
procedure mergeAcumulador(v: vec_entradas; var l: listaT);
	procedure agregarAtras(var L: listaT; t: regTotal; var ult: listaT);
		var
			aux: listaT;
		begin
			new(aux);
			aux^.dato := t;
			aux^.sig := nil;
			if (L = nil) then
				L := aux
				else
					ult^.sig := aux;
			ult := aux;
		end;
	procedure minimo(var v: vec_entradas; var min: regTotal);
		var
			pos, i: integer;
		begin
			pos := -1;
			min.codigo := 9999;
			for i := 1 to dias do
				if (v[i] <> nil) and (v[i]^.dato.codigo < min.codigo) then begin
					pos := i;
					min.codigo := v[i]^.dato.codigo;
					min.cantTotal := 1;
					end;
			if (pos <> -1) then
				v[pos] := v[pos]^.sig;
		end;
	var
		min, act: regTotal;
		ult: listaT;
	begin
		minimo(v, min);
		while (min.codigo <> 9999) do begin
			act.cantTotal := 0;
			act.codigo := min.codigo;
			while (min.codigo <> 9999) and (min.codigo = act.codigo) do begin
				act.cantTotal := act.cantTotal + min.cantTotal;
				minimo(v, min);
				end;
			agregarAtras(l, act, ult);
			end;
	end;
procedure imprimirListaRecursiva(l: listaT);
	procedure imprimirRecursiva(l: listaT);
		begin
			if (l <> nil) then begin
				write('|Codigo: ',l^.dato.codigo,' / Total: ',l^.dato.cantTotal,'|---> ');
				imprimirRecursiva(l^.sig);
				end;
		end;
	begin
		write('L ---> ');
		imprimirRecursiva(l);
		writeln('nil');
		end;
var
	ve: vec_entradas;
	lt: listaT;
	e: entrada;
begin
	Randomize;
	inicializarVector(ve);
	leerEntrada(e);
	while (e.codigo <> 0) do begin
		almacenar(ve, e);
		leerEntrada(e);
		end;
	writeln;
	imprimirVector_Listas(ve);
	mergeAcumulador(ve, lt);
	imprimirListaRecursiva(lt);
	readln;
end.