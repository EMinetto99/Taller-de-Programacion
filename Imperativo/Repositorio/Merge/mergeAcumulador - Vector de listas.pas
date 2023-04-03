procedure minimo(var v: vector; var min: tipo_dato_Vector);
	var
		i, pos: integer;
	begin
		min.campo := 9999;	// "ZZZZ" / "9999" - valor muy alto para encontrar el minimo posible
		pos := -1;			// Flag por si no encontré
		for i := 1 to dimL_Vector do	{ Recorro el vector de listas }
			{ Si la lista no esta vacia y Si encuentro un dato menor o igual al minimo, actualizo el minimo}
			if (v[i] <> nil) and (v[i]^.dato.campo <= min.campo) then begin
				pos := i;							// Guardo el indice actual
				min.campo := v[i]^.dato.campo;		// Actualizo el mínimo
			//	min.cant := v[i]^.dato.cantidad;	// (Opcional) Tomo la cantidad del dato, para luego sumar al total
				end;
		if (pos <> -1) then		{Si encontré un minimo}
			v[pos] := v[pos]^.sig;					// Paso al siguiente elemento de la lista
		end;

procedure mergeAcumulador(v: vector; var a: arbol); // var l: lista (en caso de una lista)
	var
		// ult: lista;					// Puntero al ultimo, sólo para listas
		min: tipo_dato_del_Vector;		// Dato temporal para encontrar el "minimo"
		act: tipo_dato_del_Acumulador;	// Dato acumulador
	begin
		minimo(v, min);					// Busco el minimo en el vector de listas
		while (min.campo <> 9999) do begin	{ Si encontré un minimo, sigo; sino se me terminaron las listas}
			act.cantidad := 0;			// Inicializo el contador
			act.campo := min.campo;		// Inicializo el minimo actual
			while (min.campo <> 9999) and (min.campo = act.campo) do begin	{ Si encontre un minimo, sigo; sino cambió el tipo de dato o se me terminaron las listas }
				act.cantidad := act.cantidad + min.cantidad;	// Acumulo el nuevo dato minimo encontrado
				minimo(v, min);			// Vuelvo a buscar el minimo
				end;
			agregarArbol(a, act);		// Agrego el registro acumulado a la estructura de datos a guardar
		//	agregarAtrasLista(l, act, ult);
			end;
		end;