// Cargar LISTA - AGREGANDO AL FINAL - CON PUNTERO AL ULTIMO

procedure cargarLista(var L: lista; dato: integer; var ult: lista);
		var
    		nuevo: lista;
  		begin
    		new(nuevo);
    		nuevo^.dato:= dato;
    		nuevo^.sig:= nil;
    		if (L <> nil) then
        		ult^.sig:= nuevo
    			else
        			L:= nuevo;
    		ult:= nuevo;
			end;