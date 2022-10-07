program ListaNumeros;
const
	corte=0;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: integer;
		end;
function elementoMax(L: lista);
procedure cargarLista(var L, ult: lista; n: integer);
	var
		aux: lista;
	begin
		new(aux);
		L^.dato:=n;
		L^.sig:=nil;
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
	num: integer;
begin
	le:=nil;
	ult:=nil;
	writeln('Ingrese un numero a cargar el la lista: (o "0" para cancelar.');
	readln(num);
	while (num<>0) do begin
		cargarLista(le,ult,num);
		writeln('Ingrese otro numero a cargar a la lista: (o "0" para cancelar.');
		readln(num);
		end;
	writeln('Elemento maximo de la lista: ',elementoMax(L));
end.