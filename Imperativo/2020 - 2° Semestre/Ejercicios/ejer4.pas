program ListaNumeros;
const
	corte=0;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: lista;
		end;
function buscarElemento(L: lista; n: integer):boolean;
	begin
		if (L=nil) then
			buscarElemento:=false
			else begin
				if (L^.dato=n) then
					buscarElemento:=true
					else begin
						L:=L^.sig;
						buscarElemento:=buscarElemento(L,n);
						end;
				end;
	end;
procedure elementoMax(L: lista; var max: integer);
	begin
		if (L<>nil) then begin
			if (L^.dato>max) then
				max:=L^.dato;
			L:=L^.sig;
			elementoMax(L,max);
			end;
	end;
procedure elementoMin(L: lista; var min: integer);
	begin
		if (L<>nil) then begin
			if (L^.dato<min) then
				min:=L^.dato;
			L:=L^.sig;
			elementoMin(L,min);
			end;
	end;
procedure cargarLista(var L, ult: lista; n: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=n;
		aux^.sig:=nil;
		if (L=nil) then begin
			L:=aux;
			ult:=aux;
			end
			else begin
				ult^.sig:=aux;
				ult:=aux;
				end;
	end;
var
	le, ult: lista;
	num, max, min: integer;
begin
	le:=nil;
	ult:=nil;
	max:=-9999;
	min:=9999;
	writeln('Ingrese un numero a cargar en la lista: (o "',corte,'" para terminar)');
	readln(num);
	while (num<>corte) do begin
		cargarLista(le,ult,num);
		writeln('Ingrese otro numero a cargar en la lista: (o "',corte,'" para cancelar)');
		readln(num);
		end;
	writeln('Ingrese un elemento a buscar en la lista:');
	readln(num);
	elementoMax(le,max);
	elementoMin(le,min);
	writeln('Elemento maximo de la lista: ',max);
	writeln('Elemento minimo de la lista: ',min);
	if (buscarElemento(le,num)=false) then
		writeln('El elemento ',num,' no se entontro en la lista :/')
		else
			writeln('El elemento ',num,' esta en la lista!!!');
	readln();
end.