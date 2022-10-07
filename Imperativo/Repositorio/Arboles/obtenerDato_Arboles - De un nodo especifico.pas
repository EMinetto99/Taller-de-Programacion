function obtenerDato_DeUnNodoEspecifico(a: arbol; dato: integer): integer;
	begin
		if (a = nil) then
			obtenerDato_DeUnNodoEspecifico:= -1 // -1 SI NO EXISTE EL NODO
			else begin
				if (dato < a^.dato) then
					obtenerDato_DeUnNodoEspecifico:= obtenerDato_DeUnNodoEspecifico(a^.HI, dato)
					else begin
						if (dato = a^.dato) then
							obtenerDato_DeUnNodoEspecifico:= a^.dato.datoEspecifico
							else
								obtenerDato_DeUnNodoEspecifico:= obtenerDato_DeUnNodoEspecifico(a^.HD, dato);
						end;
				end;
		end;