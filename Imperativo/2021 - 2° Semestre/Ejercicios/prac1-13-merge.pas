program EntradasDeLaSemana;
const
	cantDias=7;
type
	entrada=record
		dia: 1..cantDias;
		cod: integer;
		asiento: integer;
		monto: real;
		end;
	venta=record
		cod: integer;
		vendidas: integer;
		end;
	lista=^nodo;
	lista2=^nodo2;
	nodo=record
		dato: entrada;
		sig: lista;
		end;
	nodo2=record
		dato: venta;
		sig: lista2;
		end;
	vec_entradas=array[1..cantDias] of lista;
procedure inicializarVector(var v: vec_entradas);
	var
		i: integer;
	begin
		for i:=1 to cantDias do
			v[i]:=nil;
	end;
procedure leerEntrada(var e: entrada);
	begin
		write('Codigo de obra: ');
		readln(e.cod);
		if (e.cod<>0) then begin
			write('Dia de la obra: ');
			readln(e.dia);
{			write('Asiento: ');
			readln(e.asiento);
			write('Monto de la entrada: ');
			readln(e.monto);
}			end;
		writeln();
	end;
procedure almacenarOrdenado(var L: lista; e: entrada);
	var
		aux, act, ant: lista;
	begin
		new(aux);
		aux^.dato:=e;
		aux^.sig:=nil;
		act:=L;
		ant:=L;
		while (act<>nil) and (act^.dato.cod<e.cod) do begin
			ant:=act;
			act:=act^.sig;
			end;
		if (act=ant) then
			L:=aux
			else
				ant^.sig:=aux;
		aux^.sig:=act;
	end;
procedure minimo(var v: vec_entradas; var min: entrada);
	var
		i, minAct: integer;
	begin
		min.cod:=9999;
		minAct:=-1;
		for i:=1 to cantDias do begin
			if (v[i]<>nil) and (v[i]^.dato.cod<=min.cod) then begin
					min:=v[i]^.dato;
					minAct:=i;
					end;
			end;
		if (minAct<>-1) then
			v[minAct]:=v[minAct]^.sig;
	end;
procedure imprimirEntradas(v: vec_entradas);
	var
		i: integer;
	begin
		for i:=1 to cantDias do begin
			write('Pos (',i,') L');
			while (v[i]<>nil) do begin
				write('---> |',v[i]^.dato.cod,'|');
				v[i]:=v[i]^.sig;
				end;
			write('---> [nil]');
			writeln;
			end;
		end;
procedure imprimirLista(L: lista2);
	begin
		if (L<>nil) then begin
			write(' L');
			while (L<>nil) do begin
				write('---> |cod: ',L^.dato.cod,'|EntradasSold: ',L^.dato.vendidas,'|');
				L:=L^.sig;
				end;
			writeln;
			end
			else begin
				write('L: nil');
				writeln();
				end;
		end;
procedure agregarAtras(var l, ult: lista2; v: venta);
	var
		aux: lista2;
	begin
		new(aux);
		aux^.dato:=v;
		aux^.sig:=nil;
		if (l=nil) then
			l:=aux
			else
				ult^.sig:=aux;
		ult:=aux;
		end;
procedure mergeListas(var L: lista2; v: vec_entradas);
	var
		min: entrada; 
		act: venta;
		ult: lista2;
	begin
		ult:=nil;
		minimo(v,min);
		while (min.cod<>9999) do begin
			act.cod:=min.cod;
			act.vendidas:=0;
			while (min.cod<>9999) and (act.cod=min.cod) do begin
				act.vendidas:=act.vendidas+1;
				minimo(v,min);
				end;
			agregarAtras(L,ult,act);
			end;
		end;
var
	ve: vec_entradas;
	PriL: lista2;
	e: entrada;
begin
	PriL:=nil;
	inicializarVector(ve);
	leerEntrada(e);
	while (e.cod<>0) do begin
		almacenarOrdenado(ve[e.dia],e);
		leerEntrada(e);
		end;
	imprimirEntradas(ve);
	mergeListas(PriL,ve);
	imprimirLista(PriL);
	readln();
end.