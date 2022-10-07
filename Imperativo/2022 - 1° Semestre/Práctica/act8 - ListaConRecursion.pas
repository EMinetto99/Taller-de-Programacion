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
			ImprimirEnOrden(l^.sig);
			write('|',l^.dato,'|--->');
			end;
		end;
var
	PriL, ult: lista;
begin
	PriL:=nil;
	crearLista(PriL,ult);
	ImprimirEnOrden(PriL);
	writeln(' NIL');
	ImprimirOrdenInverso(PriL);
	writeln(' NIL');
	readln();
end.