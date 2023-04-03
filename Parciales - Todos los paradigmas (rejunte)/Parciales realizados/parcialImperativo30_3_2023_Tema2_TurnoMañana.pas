program parcialImperativo30_3_2023_Tema2;
type
	rangoDias = 1..30;
	rangoMes = 1..12;

	documento = record
		codigo: integer;
		paginas: integer;
		dia: rangoDias;
		mes: rangoMes;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: documento;
		HI: arbol;
		HD: arbol;
		end;

	lista = ^nodo;
	nodo = record
		dato: documento;
		sig: lista;
		end;
procedure leerDocumento(var d: documento);
	begin
		write('Codigo de usuario: ');
		readln(d.codigo);
		if (d.codigo <> 0) then begin
			write('Cantidad de paginas: ');
			readln(d.paginas);
			write('Dia: ');
			readln(d.dia);
			write('Mes: ');
			readln(d.mes);
			end;
		writeln;
		end;
procedure almacenar(var a: arbol; d: documento);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato := d;
			a^.HI := nil;
			a^.HD := nil;
			end
			else
				if (d.codigo < a^.dato.codigo) then
					almacenar(a^.HI, d)
					else
						almacenar(a^.HD, d);
		end;
procedure almacenarLista(a: arbol; var l: lista; num1, num2: integer);
	procedure agregarAdelante(var l: lista; d: documento);
		var
			aux: lista;
		begin
			new(aux);
			aux^.dato := d;
			aux^.sig := L;
			L := aux;
			end;
	begin
		if (a <> nil) then begin
			if (a^.dato.paginas < num2) and (a^.dato.paginas > num1) then
				agregarAdelante(l, a^.dato);
			almacenarLista(a^.HI, l, num1, num2);
			almacenarLista(a^.HD, l, num1, num2);
			end;
		end;
procedure imprimirLista(L: lista);
	begin
		write('L --->');
		while (L <> nil) do begin
			write('|',L^.dato.paginas,'|--->');
			L:= L^.sig;
			end;
		writeln(' NIL');
		end;
function buscarTotal(l: lista): integer;
	procedure recorrerListaRecursivo(l: lista; var total: integer);
		begin
			if (l <> nil) then begin
				total := total + l^.dato.paginas;
				recorrerListaRecursivo(l^.sig, total);
				end;
			end;
	var
		total: integer;
	begin
		total := 0;
		recorrerListaRecursivo(l, total);
		buscarTotal := total;
		end;
var
	d: documento;
	a: arbol;
	l: lista;
	num1, num2, total: integer;
begin
	a := nil;
	l := nil;
	leerDocumento(d);
	while (d.codigo <> 0) do begin
		almacenar(a, d);
		leerDocumento(d);
		end;
	write('Primer numero: ');
	readln(num1);
	write('Segundo numero: ');
	readln(num2);
	almacenarLista(a, l, num1, num2);
	writeln;
	imprimirLista(l);
	writeln;
	total := buscarTotal(l);
	writeln('Cantidad total de documentos de la lista: ',total);
	readln;
end.