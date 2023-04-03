// Merge de mas de dos listas usando un vector. Guarda el ultimo minimo en cada comparación
// (si existe un dato del mismo tipo) y lo guarda en una lista.

procedure minimo(var v: vector_Listas; var min: tipo_Dato);
	var
		i, pos: integer;
	begin
		min := 9999;		// "ZZZZ" / "9999" - valor muy alto para encontrar el minimo posible
		pos := -1;			// Flag por si no encontré
		for i := 1 to dimL_Vector do	{ Recorro el vector de listas }
			{ Si la lista no esta vacia y Si encuentro un dato menor o igual al minimo, actualizo el minimo}
			if (v[i] <> nil) and (v[i]^.dato.tipo_Dato <= min) then begin
				pos := i;							// Guardo el indice actual
				min := v[i]^.dato.tipo_Dato;		// Actualizo el minimo actual
				end;
		if (pos <> -1) then	{Si encontré un minimo}
			v[pos] := v[pos]^.sig;				// Paso al siguiente elemento de la lista
		end;

procedure merge(v: vector_Listas; var nueL: lista);
	var
		min: tipo_de_dato;
	begin
		nueL := nil;
		minimo(v, min);						// Busco un dato minimo entre las dos listas
		while (min <> 9999) do begin		// Si encontré un minimo
			agregarAtras(nueL, min, ult);	// Agrego el nuevo dato minimo a la estructura de datos
			minimo(v, min);					// Vuelvo a buscar un nuevo dato minimo entre las listas
			end;
		end;