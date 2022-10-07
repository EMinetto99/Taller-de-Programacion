procedure crearArbol(var a: arbol; dato: tipoDato);
		// var
		// 	  aux: arbol;
		begin
			if (a = nil) then begin
				new(a);
				a^.dato:= dato;
				a^.HI:= nil;
				a^.HD:= nil;
				end
				else begin
					if (dato<a^.dato) then
						crearArbol(a^.HI, dato)
						else
							crearArbol(a^.HD, dato); // Permite ingresar datos repetidos
					end;
			end;