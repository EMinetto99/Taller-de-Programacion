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
	num: integer;
begin
	write('Ingrese un valor a buscar en la lista: ');
	readln(num);
	if (buscarDato(PriL,num)) then
		writeln('!!!El valor ',num,' SE ENCUENTRA en la lista!!!')
		else
			writeln('El valor ingresado no se encuentra en la lista.');
	readln();
end.