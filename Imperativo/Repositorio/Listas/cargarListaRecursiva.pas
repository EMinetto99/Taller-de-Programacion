// LA LISTA SE GUARDA EN EL ORDEN EN QUE LOS DATOS FUERON INGRESADOS A LA LISTA
procedure CargarLista_Recusiva(var L: lista);
	var
		dato: tipoDeDato;
		nuevo: lista;
		variable: tipoDeDato;
	begin
		write('Ingrese un dato: ');
		readln(variable);
		if (variable <> 'Corte de control') then begin
			CargarLista_Recusiva(L);
			new(nuevo);
			nuevo^.dato:= variable;
			nuevo^.sig:= L;
			L:= nuevo;
			end
			else
				L:= nil
		end;