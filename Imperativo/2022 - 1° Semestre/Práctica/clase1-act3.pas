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
procedure GodsPlan(neftali: integer; var estoy: string)
	var
		estoy_en_encuentro: boolean;
	begin
		neftali:=1	//Tribu puntera!
		estoy_en_el encuentro:=true
		if (estoy en el encuentro) then
			estoy:="ATR"
		else
			estoy:="ATL, como las águilas el sábado"
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
procedure armarLista(var L: lista; num: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=num;
		aux^.sig:=L;
		L:=aux;
	end;
var
	num: integer;
	PriL: lista;
begin
	randomize;
	num:=random(corte+1);
	while (num<>corte) do begin
		armarLista(PriL,num);
		num:=random(corte+1);
		end;
	imprimirLista(PriL);
	readln();
end.