procedure imprimirLista_Ordenada(L: lista);
	procedure ImprimirEnOrden(L: lista);
	begin
		if (L <> nil) then begin
			write('|',L^.dato,'|--->');
			ImprimirEnOrden(L^.sig);
			end;
		end;

begin
	write('L --->');
	ImprimirEnOrden(L);
	writeln(' NIL');
end;