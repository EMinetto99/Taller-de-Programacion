program ListaEnteros;
const
	rangoN=20;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: lista;
		end;
procedure AgregarAtras(var L, ult: lista; num: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=num;
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
procedure CrearListaAgregarAtras(var L, ult: lista);
	var
		dato: integer;
	begin
		writeln('Valores generados aleatoriamente:');
		randomize;
		dato:=random(rangoN+1);
		write(dato);
		while (dato<>0) do begin
			AgregarAtras(l,ult,dato);
			dato:=random(rangoN+1);
			write(' ',dato);
			end;
		writeln;
	end;
procedure ImprimirLista(L: lista);
	begin
		write('L ');
		while (L<>nil) do begin
			write('---> |',L^.dato,'|');
			L:=L^.sig;
			end;
	end;
var
	priE, ult: lista;
begin
	priE:=nil;
	ult:=nil;
	CrearListaAgregarAtras(priE,ult);
	ImprimirLista(priE);
	readln();
end.