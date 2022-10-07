program ListaConRecursion;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: lista;
		end;
procedure cargarLista(var l:lista; dato: integer; var ult: lista);
  var
    nu: lista;
  begin
    new(nu);
    nu^.dato:=dato;
    nu^.sig:=nil;
    if l<>nil then
        ult^.sig:=nu
    	else
        	l:=nu;
    ult:=nu;
  end;
procedure crearLista(var l:lista; var ult:lista);
    var 
        dato: integer;
    begin
    	write('Ingrese un numero a ingresar en la lista (o -1 para TERMINAR): ');
        readln(dato);
        if (dato<>-1) then begin
            cargarLista(l,dato,ult);
            writeln('Dato guardado: ',dato);
            crearLista(l,ult);
        	end;
    end;
procedure ImprimirEnOrden(l: lista);
	begin
		if (l<>nil) then begin
			write('|',l^.dato,'|--->');
			ImprimirEnOrden(l^.sig);
			end;
		end;
procedure ImprimirOrdenInverso(l: lista);
	begin
		if (l<>nil) then begin
			ImprimirOrdenInverso(l^.sig);
			write('|',l^.dato,'|--->');
			end;
		end;
function buscarMinimo(l: lista; min: integer):integer;
	begin
		if (l<>nil) then begin
			if (l^.dato<min) then
				min:=l^.dato;
			buscarMinimo:=buscarMinimo(l^.sig,min);
			end;
	end;
function buscarMaximo(l: lista; max: integer):integer;
	begin
		if (l<>nil) then begin
			if (l^.dato>max) then
				max:=l^.dato;
			buscarMaximo:=buscarMaximo(l^.sig,max);
			end;
	end;
var
	PriL, ult: lista;
	min, max: integer;
begin
	PriL:=nil;
	min:=9999;
	max:=-9999;
	crearLista(PriL,ult);
	ImprimirEnOrden(PriL);
	writeln(' NIL');
	ImprimirOrdenInverso(PriL);
	writeln(' NIL');
	writeln('Valor MAXIMO de la lista: ',buscarMaximo(PriL,max));
	writeln('Valor MINIMO de la lista: ',buscarMinimo(PriL,min));
	readln();
end.