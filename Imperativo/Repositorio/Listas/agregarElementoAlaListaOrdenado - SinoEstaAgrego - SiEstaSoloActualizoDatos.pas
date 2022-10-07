program agregarElementoAlaListaOrdenado - SiNoEstaAgrego-SiEstaSoloActualizoDatos;

procedure SiEstaAgrego_SinoActualizoDatos(var L: lista; elem: dato);
	var
		aux, act, ant: lista;
	begin
		if (L=nil) then	begin	// Si L es nil, la lista está vacia y lo asigno como primer elemento.
			new(aux);			// Creo nuevo elemento, asigno el dato de entrada.
			aux^.dato:=elem;
			aux^.sig:=nil;
			L:=aux;
			end
			else begin		// Sino actualizo los punteros al primer elemento para iniciar el recorrido en la lista.
				act:=L;
				ant:=L;
				while (act<>nil) and (act^.dato.elem<dato.elem) do begin	// Condicion si el elemento debe ser MENOR o MAYOR (descendente/ascendente)
					ant:=act;				// Recorrido mientras "act" sea menor al elemento nuevo
					act:=act^.sig;			// y no se termine la lista.
					end;
				if (act=L) then begin		// Si "act" apunta al primer elemento, significa que
					if (act^.dato.elem=dato.elem) then
				    	act^.dato.actualizarDato:=act^.dato.actualizarDato+1
				    	else begin
				        	new(aux);
							aux^.dato:=elem;
							aux^.sig:=L;		// el nuevo elemento era menor al primero de la lista; entonces se hubicará
							L:=aux; 			// en el primer lugar de la lista (apuntará al primero).
							end;
			        end
			        else begin
				    	if (act^.dato.elem=dato.elem) then
							act^.dato.actualizarDato:=act^.dato.actualizarDato+1
							else begin
								new(aux);
								aux^.dato:=elem;
								ant^.sig:=aux;	// sino el nuevo es mayor al primero, por lo que puede que vaya al
								aux^.sig:=act;	// final de la lista o en el medio.
								end;
				    	end;
		        end;
		end;




