// LA LISTA IMPRIME LOS DATOS DE FORMA INVERSA AL QUE FUERON INGRESADOS

procedure ImprimirLista_RECURSIVA_OrdenInverso (L: lista);
	begin
		if (L <> nil) then begin
			ImprimirLista_RECURSIVA_OrdenInverso(L^.sig);
			write(L^.dato);
			end;
		end;