// Imprimir arbol entre valores ORDENADO


{ versión 1 (creado por mí) }
procedure imprimirArbol_EntreValores(a: arbol; valorINF, valorSUP: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato > valorINF) then
				imprimirArbol_EntreValores(a^.HI);
			if (a^.dato > calorINF) and (a^.dato < valorSUP) then
				write(a^.dato);
			if (a^.dato < valorSUP) then
				imprimirArbol_EntreValores(a^.HD);
			end;
		end;


{ versión 2 }
procedure imprimirArbol_EntreValores(a: arbol);
	begin
		if (a <> nil) then begin
			if(a^.dato > 5) and (a^.dato < 12) then begin
				imprimirArbol_EntreValores(a^.HI);
				write(a^.dato);
				imprimirArbol_EntreValores(a^.HD);
				end
				else begin
					if (a^.dato > 5) then
						imprimirArbol_EntreValores(a^.HI)
						else
							if(a^.dato < 12) then
								imprimirArbol_EntreValores(a^.HD);
					end;
			end;
		end;

{ versión 3 }
procedure Entre_Legajos(a: arbol);
begin
    if (a <> nil) then begin
        if (a^.dato.legajo > 3) then
            if(a^.dato.legajo < 6) then begin
                writeLn('Nombre: ',a^.dato.nombre);
                writeLn('Apellido: ',a^.dato.apellido);
                writeLn('Legajo: ',a^.dato.legajo);		// No lo pedia pero queria chequearlo
                Entre_Legajos(a^.HI);
                Entre_Legajos(a^.HD);
            	end
            	else begin
                	if (a^.dato.legajo > 3) then
                    	Entre_Legajos(a^.HI);
                		else
                    		if(a^.dato.legajo < 6) then
                        		Entre_Legajos(a^.HD);
                      end;
    	end;             
	end;