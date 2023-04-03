procedure minimo(var L1, L2: lista; var min: tipo_de_dato);
	begin
		min := 'ZZZZ';	// Se inicializa en minimo en valor muy alto para su obtencion
		if (L1 <> nil) and (L2 <> nil) then
			if (L1^.dato <= L2^.dato) then begin
				min := L1^.dato;
				L1 := L^.sig;
				end
				else begin
					min := L2^.dato;
					L2 := L2^.sig;
					end;
			else
				if (L1 <> nil) and (L2 = nil) then begin
					min := L1^.dato;
					L1 := L1^.sig;
					end
					else
						if (L1 = nil) and (L2 <> nil) then begin
							min := L2^.dato;
							L2 := L2^.sig;
							end;
		end;

procedure merge(L1, L2: lista; var nueL: lista);
	var
		min: tipo_de_dato;
		// ult: lista;
	begin
		nueL := nil;
		minimo(L1, L2, min);				// Busco un dato minimo entre las dos listas
		while (min <> 'ZZZZ') do begin		// Si encontré un minimo
			agregarAtras(nueL, min {ult});	// Agrego el nuevo dato minimo a la estructura de datos
			minimo(L1, L2, min);			// Vuelvo a buscar un nuevo dato minimo entre las listas
			end;
		end;