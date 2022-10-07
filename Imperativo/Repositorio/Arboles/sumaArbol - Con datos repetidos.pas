function sumaArbol_ConDatosRepetidos(a: arbol; num: integer): integer;
	begin
		if (a = nil) then
			sumaArbol_ConDatosRepetidos:= 0
			else begin
				if (num < a^.dato) then
					sumaArbol_ConDatosRepetidos:= sumaArbol_ConDatosRepetidos(a^.HI, num)
					else begin
						if (num = a^.dato) then
							sumaArbol_ConDatosRepetidos:= a^.dato.cant + sumaArbol_ConDatosRepetidos(a^.HD, num) //Optimizar con (NODO<>NIL and NODO<>num)
							else
								sumaArbol_ConDatosRepetidos:= sumaArbol_ConDatosRepetidos(a^.HD, num);
						end;
				end;
		end;