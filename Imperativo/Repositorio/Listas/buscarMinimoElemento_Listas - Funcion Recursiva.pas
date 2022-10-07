// FUNCION RECURSIVA - BUSCA EL MÍNIMO ELEMENTO DE LA LISTA

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

var
	min: integer;
begin
	min:=9999;
	writeln('Minimo elemento: ',buscarMinimo(L,min));
end.