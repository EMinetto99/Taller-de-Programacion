// LA LISTA IMPRIME LOS DATOS DE LA FORMA EN LA QUE FUERON INGRESADOS

procedure ImprimirLista_RECURSIVA_MismoOrdenIngresado (L: lista);
	begin
		if (L <> nil) then begin
			write(L^.dato);
			ImprimirLista_RECURSIVA_MismoOrdenIngresado(L^.sig);
			end;
		end;