// BUSCAR EN UN ARBOL RESPETANDO EL ORDEN. Devuelve un puntero de tipo arbol. Si no lo encuentra devuelve nil

function buscarNodo_Arboles(a: arbol; x: integer): arbol;
	begin
		if (a = nil) then
			buscarNodo_Arboles := nil
		else
			if (x = a^.dato) then
				buscarNodo_Arboles := a
				else
					if (x < a^.dato) then
						buscarNodo_Arboles := buscarNodo_Arboles(a^.HI, x)
						else
							buscarNodo_Arboles := buscarNodo_Arboles(a^.HD, x)
		end;