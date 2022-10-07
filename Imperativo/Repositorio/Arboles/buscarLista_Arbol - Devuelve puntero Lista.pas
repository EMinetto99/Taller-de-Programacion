function buscarLista_Arbol(a: arbol; num: integer): lista;
	begin
		if (a = nil) then									// Si es NIL significa que no encontre el dato
			buscarLista_Arbol := nil
			else begin
				if (a^.dato^.dato.campoReg = num) then
					buscarLista_Arbol := a^.dato				// Devuelve el PUNTERO de la LISTA dentro del ARBOL 
					else begin
						if (num < a^.dato^.dato.campoReg) then
								buscarLista_Arbol:= buscarLista_Arbol(a^.HI, num)
								else
									buscarLista_Arbol:= buscarLista_Arbol(a^.HD, num);
						end;
				end;
		end;