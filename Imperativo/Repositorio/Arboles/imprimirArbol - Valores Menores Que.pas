// Modulo que imprime valores MENORES que el ingresado por parametro

procedure imprimirArbol_MenorQue(a: arbol; num: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.leg < num) then begin
				imprimirArbol_MenorQue(a^.HI, num);
				write('|Leg: ',a^.dato.leg,' ');
				write('DNI: ',a^.dato.dni,' ');
				write('Anio: ',a^.dato.anio,'| ');
				imprimirArbol_MenorQue(a^.HD, num);
				end
				else
					if (a^.dato.leg >= num) then
						imprimirArbol_MenorQue(a^.HI, num);
			end;
		end;