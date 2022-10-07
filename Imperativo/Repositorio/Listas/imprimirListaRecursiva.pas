program listaOrdenada;

procedure imprimirListaRecursiva(L: lista);
	begin
		if (L<>nil) then begin
			write('Imprimir dato: ',L^.dato);
			imprimirListaRecursiva(L^.sig);
			end;
		end;