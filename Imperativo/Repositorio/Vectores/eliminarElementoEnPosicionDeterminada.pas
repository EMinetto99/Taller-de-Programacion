// Se elimina un elemento del vector y se realizan los corrimentos a la izquierda

procedure eliminarElemento(var v: vector; dimL: integer; pos: integer; var exito: boolean);
	var
		i: integer;
	begin
		exito := false;
		if (pos >= 1 and pos <= dimL) then begin	// Verifica que la posición sea válida
			for i := pos + 1 to dimL do		// Se corren los elementos a la izquierda
				v[i - 1] := v[i];
			dimL := dimL - 1;				// Se reduce la cantidad de elementos
			exito := true;
			end;
		end;