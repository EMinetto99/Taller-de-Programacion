procedure imprimirVector_Listas(v: vector);
	procedure imprimirLista(L: lista);
		begin
			write('L --->');
			while (L <> nil) do begin
				write('|',L^.dato,'|--->');
				L := L^.sig;
				end;
			writeln(' NIL');
			end;
	var
		i: integer;
	begin
		for i := 1 to dimL do begin
			write('[',i,'] ');
			imprimirLista(v[i]);
			end;
		writeln;
		end;