// Imprimir arbol entre valores ORDENADO


{ versión 1 (creado por mí) }
procedure imprimirArbol_EntreValores(a: arbol; valorINF, valorSUP: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato > valorINF) then			// hay que optimizar, pregunta lo mismo varias veces
				imprimirArbol_EntreValores(a^.HI, valorINF, valorSUP);
			if (a^.dato > valorINF) and (a^.dato < valorSUP) then
				write(a^.dato);
			if (a^.dato < valorSUP) then
				imprimirArbol_EntreValores(a^.HD, valorINF, valorSUP);
			end;
		end;


{ versión 2 }
procedure imprimirArbol_EntreValores(a: arbol; valorINF, valorSUP: integer);
	begin
		if (a <> nil) then
			if(a^.dato > valorINF) and (a^.dato < valorSUP) then begin
				imprimirArbol_EntreValores(a^.HI, valorINF, valorSUP);
				write(a^.dato);
				imprimirArbol_EntreValores(a^.HD, valorINF, valorSUP);
				end
				else begin
					if (a^.dato > valorINF) then
						imprimirArbol_EntreValores(a^.HI, valorINF, valorSUP)
						else
							if(a^.dato < valorSUP) then
								imprimirArbol_EntreValores(a^.HD, valorINF, valorSUP);
					end;
		end;

{ versión 3 }
procedure Entre_Legajos(a: arbol);
begin
    if (a <> nil) then begin
        if (a^.dato.legajo > 3) then
            if(a^.dato.legajo < 6) then begin
                writeln('Nombre: ',a^.dato.nombre);
                writeln('Apellido: ',a^.dato.apellido);
                writeln('Legajo: ',a^.dato.legajo);		// No lo pedia pero queria chequearlo
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