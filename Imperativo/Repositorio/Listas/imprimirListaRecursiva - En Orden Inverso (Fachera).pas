procedure imprimirLista_Inversa(L: lista);
	procedure ImprimirOrdenInverso(L: lista);
	begin
		if (L <> nil) then begin
			ImprimirOrdenInverso(L^.sig);
			write('|',L^.dato,'|--->');
			end;
		end;

begin
	write('L --->');
	ImprimirOrdenInverso(L);
	writeln(' NIL');
end;