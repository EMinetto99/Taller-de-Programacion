// FUNCION RECURSIVA - BUSCA EL MÁXIMO ELEMENTO DE LA LISTA

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

var
	max: integer;
begin
	max:=-9999;
	writeln('Maximo elemento: ',buscarMaximo(L,max));
end.