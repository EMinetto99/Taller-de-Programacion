function sumaArbol_SumaTotal(a: arbol): integer;
	begin
		if (a <> nil) then
			sumaArbol_SumaTotal:= sumaArbol_SumaTotal(a^.HI) + sumaArbol_SumaTotal(a^.HD);
			else
				sumaArbol_SumaTotal:= 0;
		end;