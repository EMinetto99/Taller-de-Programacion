// IMPRIMIR LISTA - ITERATIVA

procedure imprimirLista(L: lista);
	begin
		write('L --->');
		while (L <> nil) then begin
			write('|',L^.dato,'|--->');
			L:= L^.sig;
			end;
		writeln(' NIL');
		end;