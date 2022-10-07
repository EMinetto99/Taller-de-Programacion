program listaOrdenada;

procedure agregarListaOrdenado(var L: lista; valor: integer);
	var
		aux, act, ant: lista;
	begin
		new(aux);			// Creo nuevo elemento, asigno el dato de entrada.
		aux^.dato:=valor;
		aux^.sig:=nil;
		if (L=nil) then		// Si L es nil, la lista está vacia y lo asigno como primero.
			L:=aux;
			else begin		// Sino actualizo los punteros al primer elemento para iniciar el recorrido en la lista.
				act:=L;
				ant:=L;
				while (act<>nil) and (act^.dato<aux^.dato) do begin	// Condicion si el elemento debe ser MENOR o MAYOR (descendente/ascendente)
					ant:=act;				// Recorrido mientras "act" sea menor al elemento nuevo
					act:=act^.sig;			// y no se termine la lista.
					end;
				if (act=L) then begin	// Si "act" apunta al primer elemento, significa que
					aux^.sig:=L;		// el nuevo elemento era menor al primero de la lista; entonces se hubicará
					L:=aux;				// en el primer lugar de la lista (apuntará al primero).
					end
					else begin
						ant^.sig:=aux;	// sino el nuevo es mayor al primero, por lo que puede que vaya al
						aux^.sig:=act;	// final de la lista o en el medio.
						end;
				end;
		end;