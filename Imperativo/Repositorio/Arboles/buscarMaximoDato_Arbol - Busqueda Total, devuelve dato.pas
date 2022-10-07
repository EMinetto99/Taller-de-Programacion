// Devuelve el DATO más grande del arbol (recorrido total)
// HACER UNA FUNCION O UN PROCESO QUEDA A GUSTO DEL PROGRAMADOR.

function maximoDATO(a: arbol): integer;
	procedure buscarMaximoDato_SinOrden(a: arbol; var max: integer);
		begin
			if (a <> nil) then begin
				buscarMaximoDato_SinOrden(a^.HI, max);
				if (a^.dato > max) then
					max := a^.dato;
				buscarMaximoDato_SinOrden(a^.HD, max);
				end;
			end;
	var
		max: integer;
	begin
		max:= -9999;
		buscarMaximoDato_SinOrden(a, max);
		maximoDATO:= max;
		end;