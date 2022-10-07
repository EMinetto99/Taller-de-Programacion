program ListaDescontrolada;
uses crt;
const
	corte=15;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: lista;
		end;
procedure imprimirLista(L: lista);
	begin
		if (L<>nil) then begin
			write('L --->');
			textbackground(white);
			textcolor(black);
			write('| ',L^.dato);
			L:=L^.sig;
			while (L<>nil) do begin
				write(' |');
				textbackground(black);
				textcolor(white);
				write('--->');
				textbackground(white);
				textcolor(black);
				write('| ',L^.dato);
				L:=L^.sig;
				end;
			writeln(' |N]');
			textbackground(black);
			textcolor(white);
			end
			else begin
				write('L: ');
				textcolor(yellow);
				writeln('nil');
				textcolor(white);
				end;
	end;
procedure armarLista(var L, ult: lista; n: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=n;
		aux^.sig:=nil;
		if (L=nil) then
			L:=aux
			else
				ult^.sig:=aux;
		ult:=aux;
	end;
var
	num: integer;
	PriL, ult: lista;
begin
	PriL:=nil;
	ult:=nil;
	randomize;
	num:=random(corte+1);
	while (num<>corte) do begin
		armarLista(PriL,ult,num);
		num:=random(corte+1);
		end;
	imprimirLista(PriL);
	readln();
end.