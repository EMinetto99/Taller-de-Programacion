program practica2act3;
const
	rangeRND=100;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: lista;
		end;
procedure GenerarNumeros(var L: lista; var ult: lista);
	procedure cargarLista(var L: lista; dato: integer; var ult: lista);
		var
    		nuevo: lista;
  		begin
    		new(nuevo);
    		nuevo^.dato:= dato;
    		nuevo^.sig:= nil;
    		if (L <> nil) then
        		ult^.sig:= nuevo
    			else
        			L:= nuevo;
    		ult:= nuevo;
			end;
	var
		num: integer;
	begin
		randomize;
		num:= random(rangeRND);
		while (num <> 0) do begin
			cargarLista(L, num, ult);
			num:= random(rangeRND);
			end;
		end;
procedure ImprimirEnOrden(L: lista);
	begin
		if (L <> nil) then begin
			write('|',L^.dato,'|--->');
			ImprimirEnOrden(L^.sig);
			end;
		end;
function buscarMinimo(L: lista; min: integer): integer;
	begin
		if (L <> nil) then begin
			if (L^.dato<min) then
				min:=L^.dato;
			buscarMinimo:=buscarMinimo(L^.sig,min);
			end
			else
				buscarMinimo:=min;
	end;
function buscarMaximo(L: lista; max: integer): integer;
	begin
		if (L <> nil) then begin
			if (L^.dato>max) then
				max:=L^.dato;
			buscarMaximo:=buscarMaximo(L^.sig,max);
			end
			else
				buscarMaximo:=max;
	end;
function buscarDato(L: lista; num: integer): boolean;
	begin
		if (L <> nil) then begin
			if (L^.dato = num) then
				buscarDato:=true
				else
					buscarDato:=buscarDato(L^.sig,num);
			end
			else
				buscarDato:=false;
		end;
var
	PriL, ult: lista;
	min, max, num: integer;
begin
	PriL:=nil;
	min:=9999;
	max:=-9999;
	GenerarNumeros(PriL,ult);
	write('L --->');
	ImprimirEnOrden(PriL);
	writeln(' NIL');
	writeln('Valor MINIMO de la lista: ',buscarMinimo(PriL,min));
	writeln('Valor MAXIMO de la lista: ',buscarMaximo(PriL,max));
	write('Ingrese un valor a buscar en la lista: ');
	readln(num);
	if (buscarDato(PriL,num)) then
		writeln('!!!El valor ',num,' SE ENCUENTRA en la lista!!!')
		else
			writeln('El valor ingresado no se encuentra en la lista.');
	readln();
end.