program ordenacion_por_Seleccion_Vectores;

procedure ordenarVectorPorSeleccion(var v: vector; dimL: integer);
	var
		i, j, p, item: integer;
	begin
		for i:=1 to dimL-1 do begin		{Recorre buscando el mínimo elemento en cada pasada con respecto al puntero "p" para el posterior intercambio}
			p := i;
			for j := i+1 to dimL do			{Busca el mínimo elemento}
				if v[ j ] < v[ p ] then		{Ordena de mayor a menor}
					p:=j;
			{ intercambia v[i] y v[p] }
			item := v[ p ];
			v[ p ] := v[ i ];
			v[ i ] := item;
			end;
		end;